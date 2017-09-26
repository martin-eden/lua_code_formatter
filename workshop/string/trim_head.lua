return
  function(s)
    local result
    if (s:sub(1, 1) == ' ') then
      local start_pos = 2
      while (s:sub(start_pos, start_pos) == ' ') do
        start_pos = start_pos + 1
      end
      result = s:sub(start_pos)
    else
      result = s
    end
    return result
  end
