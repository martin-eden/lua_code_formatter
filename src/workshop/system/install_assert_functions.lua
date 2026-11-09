-- Function to create "assert_<type>" global functions

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

local spawn_assert_func
do
  local str_format = string.format

  spawn_assert_func =
    function(type_name)
      local checker = _G['is_'.. type_name]

      assert(checker)

      return
        function(val)
          if not checker(val) then
            local err_msg =
              str_format('assert_%s(%s)', type_name, tostring(val))

            error(err_msg)
          end
        end
    end
end

local type_names = request('!.concepts.lua.type_names')
local number_type_names = request('!.concepts.lua.number_type_names')

local install_assert_funcs =
  function()
    for _, type_name in ipairs(type_names) do
      _G['assert_' .. type_name] = spawn_assert_func(type_name)
    end

    for _, number_type_name in ipairs(number_type_names) do
      _G['assert_' .. number_type_name] = spawn_assert_func(number_type_name)
    end
  end

-- Export:
return install_assert_funcs

--[[
  2018 #
  2020 #
  2022 #
  2024 #
  2026 #
]]
