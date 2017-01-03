local parse_seq = request('seq')

return
  function(struc, s, s_pos, parse_func)
    local parse_result, new_s_pos = parse_seq(struc, s, s_pos, parse_func)
    parse_result = true
    return parse_result, new_s_pos
  end
