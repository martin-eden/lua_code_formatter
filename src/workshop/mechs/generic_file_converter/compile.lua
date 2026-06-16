local table_to_str = request('!.formats.lua_table_code.save')

return
  function(t)
    if is_table(t) then
      return table_to_str(t)
    else
      return t
    end
  end
