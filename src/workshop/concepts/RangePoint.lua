-- Point in 1-d range

--[[
  Author: Martin Eden
  Last mod.: 2026-09-24
]]

--[[
  Data storage format

    1 [i] Current value
    2 [i] Minimum value
    3 [i] Maximum value
]]

local get_min_value =
  function(Me)
    return Me[2]
  end

local set_min_value =
  function(Me, val)
    Me[2] = val
  end

local get_max_value =
  function(Me)
    return Me[3]
  end

local set_max_value =
  function(Me, val)
    Me[3] = val
  end

local get_value
local set_value
do
  local min = math.min
  local max = math.max

  get_value =
    function(Me)
      return min(max(Me[1], Me[2]), Me[3])
    end

  set_value =
    function(Me, value)
      Me[1] = min(max(value, Me[2]), Me[3])
    end
end

local Interface

local create
do
  local attach_methods = request('!.table.attach_methods')
  create =
    function()
      local Core = { 0, 0, 1 }
      attach_methods(Core, Interface)

      return Core
    end
end

Interface =
  {
    create = create,

    GetMinValue = get_min_value,
    SetMinValue = set_min_value,

    GetMaxValue = get_max_value,
    SetMaxValue = set_max_value,

    GetValue = get_value,
    SetValue = set_value,
  }

-- Export:
return Interface

--[[
  2026 # # #
  2026-09-24
]]
