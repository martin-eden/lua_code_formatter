-- Personal framework bootloader

--[[
  Author: Martin Eden
  Last mod.: 2026-09-24
]]

--[[
  Point of code organization with small files and directories
  is relative "require()" and ability to deploy only used files.
]]

--[[
  Installed globals

  * Global "request()"

    Relative "require()" for files located in this directory.

    Uses extended name syntax:

      ^. -- upper directory
      !. -- root directory

  * Global "get_base_prefix()"

    Implementation of "request()" knows it's own module name prefix
    for "require()". It's critical information for niche tools.
    Used by [require_file].

  * Convenience globals

    Modules that made global because they are used often:

    * is_..() family -- checks value type

      is_boolean(), is_number, is_integer(), is_float(), is_table() ...

    * assert_..() family -- asserts value type

      assert_boolean(), assert_number(), assert_integer(), ...

    * new() -- clones table and applies optional field overrides
]]

--[[
  How it works

  When you do "require('martin.workshop.base')" then
  root code in file "martin/workshop/base.lua"
  receives vararg "..." with values ( martin.workshop.base ).

  We extract and store in internal state module prefix "martin.workshop."
  and use it for relative require() modules in that directory.
]]

local set_base_prefix
local split_name
local get_base_prefix
local request
local stack_init
local stack_add
local stack_remove
do
  local str_match = string.match
  local str_find = string.find
  local str_sub = string.sub
  local tbl_pack = table.pack
  local tbl_unpack = table.unpack
  local require = require

  local empty = ''

  local stack_get
  do
    local Names
    local depth

    stack_init =
      function()
        Names = { }
        depth = 1
      end

    stack_get =
      function()
        return Names[depth]
      end

    stack_add =
      function(prefix, name)
        depth = depth + 1
        Names[depth] = { prefix = prefix, name = name }
      end

    stack_remove =
      function()
        depth = depth - 1
      end
  end

  local get_caller_prefix =
    function()
      local NameRec = stack_get()

      if not NameRec then return empty end

      return NameRec.prefix
    end

  do
    -- a.b.c -> ( a.b. c )
    local prefix_name_capture = '^(.+%.)([^%.]+)$'

    split_name =
      function(qualified_name)
        local prefix, name =
          str_match(qualified_name, prefix_name_capture)

        if not prefix then
          prefix = empty
          if str_find(qualified_name, '%.') then
            name = empty
          else
            name = qualified_name
          end
        end

        return prefix, name
      end
  end

  -- Apply relative path prefix
  local apply_rel_prefix
  do
    -- a.b.c. -> a.b.
    local uplevel_capture = '(.+%.)[^%.]-%.$'

    apply_rel_prefix =
      function(base_prefix, rel_prefix)
        while (str_sub(rel_prefix, 1, 2) == '^.') do
          if (base_prefix == empty) then
            error("Link is outside of caller's prefix.")
          end
          base_prefix = str_match(base_prefix, uplevel_capture) or empty
          rel_prefix = str_sub(rel_prefix, 3)
        end

        return base_prefix .. rel_prefix
      end
  end

  do
    local base_prefix

    set_base_prefix =
      function(arg_base_prefix)
        base_prefix = arg_base_prefix
      end

    get_base_prefix =
      function()
        return base_prefix
      end
  end

  local get_require_name =
    function(qualified_name)
      local caller_prefix

      local is_absolute_name = (str_sub(qualified_name, 1, 2) == '!.')

      if is_absolute_name then
        qualified_name = str_sub(qualified_name, 3)
        caller_prefix = get_base_prefix()
      else
        caller_prefix = get_caller_prefix()
      end

      local prefix, name = split_name(qualified_name)
      prefix = apply_rel_prefix(caller_prefix, prefix)

      return prefix .. name
    end

  request =
    function(qualified_name)
      local require_name = get_require_name(qualified_name)

      stack_add(split_name(require_name))

      local Results = tbl_pack(require(require_name))

      stack_remove()

      return tbl_unpack(Results)
    end
end

-- Setup and export globals
do
  -- First element is invocation module name
  local our_require_name = (...)

  set_base_prefix(split_name(our_require_name))

  _G.request = request
  _G.get_base_prefix = get_base_prefix

  -- We can now use request() but need to add our name to call stack

  stack_init()
  stack_add(empty, our_require_name)

  request('!.system.install_is_functions')()
  request('!.system.install_assert_functions')()
  _G.new = request('!.table.new')

  stack_remove()
end

--[[
  2016 #
  2017 #
  2018 # #
  2024 #
  2026 # # # #
  2026-09-24
]]
