local table_to_str = request('!.formats.lua_table_code.save')
local table_to_str_params = {serializer = {always_index_keys = false}}

return
  function(t)
    if is_table(t) then
      return table_to_str(t, table_to_str_params)
    else
      return t
    end
  end
