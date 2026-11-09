-- Function to create "is_<type>" family of global functions

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  It spawns "is_nil", "is_boolean", ... for all Lua data types.
  Also it spawns "is_integer" and "is_float" for number type.
]]

local type_is =
  function(type_name)
    return
      function(val)
        return (type(val) == type_name)
      end
  end

local number_is
do
  local math_type = math.type

  number_is =
    function(type_name)
      return
        function(val)
          --[[
            math.type() throws error for non-number types.
            This function returns "false" for non-number types.
          ]]
          if not is_number(val) then
            return false
          end
          return (math_type(val) == type_name)
        end
    end
end

local type_names = request('!.concepts.lua.type_names')
local number_type_names = request('!.concepts.lua.number_type_names')

-- Export:
return
  function()
    for _, type_name in ipairs(type_names) do
      _G['is_' .. type_name] = type_is(type_name)
    end

    for _, number_type_name in ipairs(number_type_names) do
      _G['is_' .. number_type_name] = number_is(number_type_name)
    end
  end

--[[
  2018 #
  2020 #
  2022 #
  2024 #
  2026 #
]]
