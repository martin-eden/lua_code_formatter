return
  function(s)
    local result
    if (s:sub(-1, -1) == ' ') then
      local finish_pos = #s - 1
      while (s:sub(finish_pos, finish_pos) == ' ') do
        finish_pos = finish_pos - 1
      end
      result = s:sub(1, finish_pos)
    else
      result = s
    end
    return result
  end
