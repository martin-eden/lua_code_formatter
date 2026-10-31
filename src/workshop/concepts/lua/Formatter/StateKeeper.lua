-- Oneline/multiline formatting style tracking

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

--[[
  Storage format

    1 [i] -- index
    2 [t] -- states
]]

local next_level =
  function(Me)
    Me[1] = Me[1] + 1
  end

local prev_level =
  function(Me)
    Me[1] = Me[1] - 1
  end

local get_state =
  function(Me)
    return Me[2][Me[1]]
  end

local set_next_state =
  function(Me, State)
    Me[2][Me[1] + 1] = State
  end

local Interface
local create
do
  local attach_methods = request('!.table.attach_methods')
  create =
    function()
      local Me = { 0, { } }
      attach_methods(Me, Interface)
      return Me
    end
end

Interface =
  {
    create = create,

    NextLevel = next_level,
    PrevLevel = prev_level,
    GetState = get_state,
    SetNextState = set_next_state,
  }

-- Export:
return Interface

--[[
  2017 #
  2026-10-31
]]
