-- Dumps table to lua code which recreates table.

local table_serializer_class =
  request('^.^.^.compile.lua.serialize_table.lua_code.interface')

return
  function(t, options)
    assert_table(t)
    local table_serializer = new(table_serializer_class, options)
    table_serializer:init()
    table_serializer:serialize(t)
    return table_serializer:get_result()
  end
