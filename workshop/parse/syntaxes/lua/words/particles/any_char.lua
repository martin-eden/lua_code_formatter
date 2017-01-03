return
  function(s, s_pos)
    if (s_pos <= #s) then
      return true, s_pos + 1
    end
  end
