--[[
  Lua base libraries extensions. Used almost in any piece of my code.

  This module installs global function "request" which is based on
  "require" and makes relative module names possible.

  Also this function tracks module dependencies. This allows to
  get dependencies list for any module. Which is used in creating
  deploys without unused code.

  Price for this is exported global table "dependencies" and function
  "get_require_name".

  And lastly, global functions are added for convenience. Such
  functions are families of "is_<type>", "assert_<type>" and "new".

  "new" basically clones given table. But may override fields in
  clone with fields of second table argument.
]]

-- Export request function:
local split_name =
  function(qualified_name)
    local prefix_name_pattern = '^(.+%.)([^%.]+)$'  -- a.b.c --> (a.b.) (c)
    local prefix, name = qualified_name:match(prefix_name_pattern)
    if not prefix then
      prefix = ''
      name = qualified_name
      if not name:find('^([^%.]+)$') then
        name = ''
      end
    end
    return prefix, name
  end

local unite_prefixes =
  function(base_prefix, rel_prefix)
    local init_base_prefix, init_rel_prefix = base_prefix, rel_prefix
    local list_without_tail_pattern = '(.+%.)[^%.]-%.$' -- a.b.c. --> (a.b.)
    local list_without_head_pattern = '[^%.]+%.(.+)$' -- a.b.c. --> (b.c.)
    while rel_prefix:find('^%^%.') do
      if (base_prefix == '') then
        error(
          ([[Link "%s" is outside caller's prefix "%s".]]):format(
            init_rel_prefix,
            init_base_prefix
          )
        )
      end
      base_prefix = base_prefix:match(list_without_tail_pattern) or ''
      rel_prefix = rel_prefix:match(list_without_head_pattern) or ''
    end
    return base_prefix .. rel_prefix
  end

local names = {}
local deep = 1

local get_caller_prefix =
  function()
    local result = ''
    if names[deep] then
      result = names[deep].prefix
    end
    return result
  end

local get_caller_name =
  function()
    local result = 'anonymous'
    if names[deep] then
      result = names[deep].prefix .. names[deep].name
    end
    return result
  end

local push =
  function(prefix, name)
    deep = deep + 1
    names[deep] = {prefix = prefix, name = name}
  end

local pop =
  function()
    deep = deep - 1
  end

local dependencies = {}
local add_dependency =
  function(src_name, dest_name)
    dependencies[src_name] = dependencies[src_name] or {}
    dependencies[src_name][dest_name] = true
  end

local base_prefix = split_name((...))

local get_require_name =
  function(qualified_name)
    local is_absolute_name = (qualified_name:sub(1, 2) == '!.')
    if is_absolute_name then
      qualified_name = qualified_name:sub(3)
    end
    local prefix, name = split_name(qualified_name)
    local caller_prefix =
      is_absolute_name and base_prefix or get_caller_prefix()
    prefix = unite_prefixes(caller_prefix, prefix)
    return prefix .. name, prefix, name
  end

local request =
  function(qualified_name)
    local src_name = get_caller_name()

    local require_name, prefix, name = get_require_name(qualified_name)

    push(prefix, name)
    local dest_name = get_caller_name()
    add_dependency(src_name, dest_name)
    local results = table.pack(require(require_name))
    pop()

    return table.unpack(results)
  end

if not _G.request then
  _G.request = request
  _G.dependencies = dependencies
  _G.get_require_name = get_require_name
  push('', 'base')
  request('!.system.install_is_functions')
  request('!.system.install_assert_functions')
  _G.new = request('!.table.new')
  pop()
end
