-- Lua base libraries extensions. Used almost in any piece of my code.

-- Export "is_<type>" and "assert_<type>" functions:
do
  local data_types =
    {
      'boolean',
      'function',
      'nil',
      'number',
      'string',
      'table',
      'thread',
      'userdata',
    }
  for k, type_name in ipairs(data_types) do
    _G['is_' .. type_name] = function(a) return (type(a) == type_name) end
    _G['assert_' .. type_name] =
      function(a, responsibility_level)
        local responsibility_level = (responsibility_level or 1)
        if (type(a) ~= type_name) then
          error(
            ('Argument must have a type "%s", not "%s".'):format(type_name, type(a)),
            responsibility_level + 1
          )
        end
      end
  end
  _G.is_integer = function(n) return (math.type(n) == 'integer') end
  _G.assert_integer =
    function(a, responsibility_level)
      local responsibility_level = (responsibility_level or 1)
      if (math.type(a) ~= 'integer') then
        error(('Argument must be integer, not %s.'):format(type(a)), responsibility_level + 1)
      end
    end
end

-- Make sure we have table.pack and table.unpack:
do
  _G.table.pack = _G.table.pack or _G.pack
  _G.table.unpack = _G.table.unpack or _G.unpack
end

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

local request =
  function(qualified_name)
    local prefix, name = split_name(qualified_name)
    local src_name = get_caller_name()
    prefix = unite_prefixes(get_caller_prefix(), prefix)
    push(prefix, name)
    local dest_name = get_caller_name()
    add_dependency(src_name, dest_name)
    local require_name = prefix .. name
    local results = table.pack(require(require_name))
    pop()
    return table.unpack(results)
  end

if not _G.request then
  _G.request = request
  _G.dependencies = dependencies
end

local prefix = split_name((...))
_G.new = request(prefix .. 'handy_mechs.new')
