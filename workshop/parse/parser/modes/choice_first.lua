return
  function(struc, s, s_pos, parse_func)
    local parse_result, new_s_pos
    for i = 1, #struc do
      local term = struc[i]
      parse_result, new_s_pos = parse_func(term, s, s_pos)
      if parse_result then
        break
      end
    end
    return parse_result, new_s_pos
  end
