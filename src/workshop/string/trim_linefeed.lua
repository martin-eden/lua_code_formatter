local newline_chars =
  {
    ['\x0d'] = true,
    ['\x0a'] = true,
  }

return
  function(s)
    assert_string(s)
    local finish_pos = #s
    while newline_chars[s:sub(finish_pos, finish_pos)] do
      finish_pos = finish_pos - 1
    end
    local result = s:sub(1, finish_pos)
    return result
  end
