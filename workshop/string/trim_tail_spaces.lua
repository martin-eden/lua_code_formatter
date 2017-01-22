return
  function(s)
    assert_string(s)
    local finish_pos = #s
    while (s:sub(finish_pos, finish_pos) == ' ') do
      finish_pos = finish_pos - 1
    end
    local result = s:sub(1, finish_pos)
    return result
  end
