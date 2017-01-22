return
  function(s)
    assert_string(s)
    local start_pos = 1
    while (s:sub(start_pos, start_pos) == ' ') do
      start_pos = start_pos + 1
    end
    local result = s:sub(start_pos)
    return result
  end
