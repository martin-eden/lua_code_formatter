-- Seekable output sequence

--[[
  Author: Martin Eden
  Last mod.: 2026-11-19
]]

--[[
  Storage format

    1 [i] position
    2 [t] sequence
]]

local set_position =
  function(me, idx)
    me[1] = idx
    for i = #me[2], me[1], -1 do
      me[2][i] = nil
    end
  end

local get_position =
  function(me)
    return me[1]
  end

local write =
  function(me, item)
    me[2][me[1]] = item
    me[1] = me[1] + 1
  end

local get_values =
  function(me)
    return me[2]
  end

local interface
local create
do
  local attach_methods = request('!.table.attach_methods')
  create =
    function()
      local me = { 1, { } }
      attach_methods(me, interface)
      return me
    end
end

interface =
  {
    -- Core:
    create = create,
    get_position = get_position,
    set_position = set_position,
    write = write,
    -- Extensions:
    get_values = get_values,
  }

-- Export:
return interface

--[[
  2017
  2026 # #
  2026-11-19
]]
