local parse_seq = request('seq')

return
  function(struc, s, s_pos, parse_func)
    local parse_result, new_s_pos = parse_seq(struc, s, s_pos, parse_func)
    if parse_result then
      local next_match_result
      repeat
        s_pos = new_s_pos
        next_match_result, new_s_pos = parse_seq(struc, s, s_pos, parse_func)
      until not next_match_result
      new_s_pos = s_pos
    end
    return parse_result, new_s_pos
  end
