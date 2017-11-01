local newline_chars =
  {
    ['\013'] = true,
    ['\010'] = true,
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
