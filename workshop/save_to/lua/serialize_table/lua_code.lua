-- Dumps table to lua code which recreates table.

local override_params = request('^.^.^.handy_mechs.override_params')
local default_params = request('^.^.^.compile.lua.serialize_table.lua_code.interface')

return
  function(value, a_params)
    assert_table(value)
    local object = override_params(default_params, a_params)
    object:init()
    object:serialize(value)
    return object.serializer.string_adder:get_result()
  end
