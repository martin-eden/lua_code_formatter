return
  function(struc, s, s_pos, parse_func)
    local parse_result, new_s_pos
    local struc_type = type(struc)
    if (struc_type == 'table') then
      local term
      local term_s_pos = s_pos
      for i = 1, #struc do
        term = struc[i]
        parse_result, new_s_pos = parse_func(term, s, term_s_pos)
        if not parse_result then
          break
        end
        term_s_pos = new_s_pos
      end
    elseif (struc_type == 'string') then
      -- consume() function inlined here due minor performance boost:
      local term_len = #struc
      if (term_len == 0) then
        parse_result = true
        new_s_pos = s_pos
      elseif (s:sub(s_pos, s_pos + term_len - 1) == struc) then
        parse_result = true
        new_s_pos = s_pos + term_len
      else
        parse_result = false
        new_s_pos = s_pos
      end
    elseif (struc_type == 'function') then
      parse_result, new_s_pos = struc(s, s_pos)
      -- print(('Called func returned %s.'):format(parse_result))
    end
    if not parse_result then
      new_s_pos = s_pos
    end
    return parse_result, new_s_pos
  end
