return
  function(t)
    assert_table(t)
    local result = {}
    for k, v in pairs(t) do
      result[#result + 1] = {key = k, value = v}
    end
    return result
  end
