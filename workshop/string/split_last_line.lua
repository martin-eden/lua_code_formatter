return
  function(s)
    local base, last_line

    for i = #s, 1, -1 do
      if (s:sub(i, i) == '\n') then
        base = s:sub(1, i)
        last_line = s:sub(i + 1)
        last_line = last_line or ''
        break
      end
    end

    if not base then
      base = ''
      last_line = s
    end

    return base, last_line
  end
