return
  function(data_struc)
    assert_table(data_struc)
    local result =
      {
        code = {},
        comments = {},
      }
    for i = 1, #data_struc do
      if (data_struc[i].name == 'code') then
        table.insert(result.code, data_struc[i].value)
      elseif (data_struc[i].name == 'comment') then
        table.insert(result.comments, data_struc[i].value)
      end
    end
    result.code = table.concat(result.code)
    result.comments = table.concat(result.comments, '\n')
    return result
  end
