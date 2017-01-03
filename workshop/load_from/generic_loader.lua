local parser = request('^.parse.parser')

return
  function(str, syntax, struc_transformer)
    local result
    local parse_result, finish_pos, data_struc = parser.parse(syntax, str)
    if parse_result then
      result = data_struc
      if struc_transformer then
        result = struc_transformer(result)
      end
    end
    return result
  end
