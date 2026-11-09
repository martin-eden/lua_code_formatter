-- Oneline/multiline formatting style tracking

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  Storage format

    1 [i] -- index
    2 [t] -- states
]]

local next_level =
  function(me)
    me[1] = me[1] + 1
  end

local prev_level =
  function(me)
    me[1] = me[1] - 1
  end

local get_state =
  function(me)
    return me[2][me[1]]
  end

local set_next_state =
  function(me, State)
    me[2][me[1] + 1] = State
  end

local interface
local create
do
  local attach_methods = request('!.table.attach_methods')
  create =
    function()
      local me = { 0, { } }
      attach_methods(me, interface)
      return me
    end
end

interface =
  {
    create = create,

    next_level = next_level,
    prev_level = prev_level,
    get_state = get_state,
    set_next_state = set_next_state,
  }

-- Export:
return interface

--[[
  2017 #
  2026-10-31
]]
