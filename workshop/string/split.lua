return
  function(s, delim)
    assert_string(s)
    local delim = delim or '\n'
    local result = {}
    local last_pos = 1
    for line, _last_pos in string.gmatch(s, '(.-)' .. delim .. '()') do
      result[#result + 1] = line
      last_pos = _last_pos
    end
    result[#result + 1] = s:sub(last_pos)
    return result
  end
