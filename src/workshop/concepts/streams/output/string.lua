-- Output stream on string

--[[
  Author: Martin Eden
  Last mod.: 2026-11-13
]]

--[[
  String concatenation is time-expensive in Lua.
  So Write() adds strings to internal table.
  That's memory-expensive.
]]

--[[
  Storage format

    [t] -- list with string chunks
]]

local write
do
  local add_to = request('!.concepts.list.add_item')
  write =
    function(me, data_str)
      assert_string(data_str)
      add_to(me, data_str)
    end
end

local get_string
do
  local list_to_string = request('!.concepts.list.to_string')
  get_string =
    function(me)
      return list_to_string(me)
    end
end

local interface
local create
do
  local attach_methods = request('!.table.attach_methods')
  create =
    function()
      local me = { }
      attach_methods(me, interface)
      return me
    end
end

interface =
  {
    create = create,
    write = write,
    get_string = get_string,
  }

-- Export:
return interface

--[[
  2024 # # # #
  2025 #
  2026 # #
  2026-10-14
]]
