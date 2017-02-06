local parser = request('parser')
local c_string_stream = request('!.mechs.streams.readable_string.interface')

-- local to_str = request('!.formats.lua_table_code.save')
return
  function(str, syntax, ...)
    -- print(to_str(syntax))
    local string_stream = new(c_string_stream)
    string_stream:init(str)

    local result, data_struc = parser.parse(string_stream, syntax)
    if result then
      result = data_struc
      for i = 1, select('#', ...) do
        local struc_transformer = select(i, ...)
        if struc_transformer then
          result = struc_transformer(string_stream, result)
        end
      end
    end
    return result
  end
