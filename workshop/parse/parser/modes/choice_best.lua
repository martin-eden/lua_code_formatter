local folder = request('^.folder')

return
  function(struc, s, s_pos, parse_func)
    local parse_result, new_s_pos
    local best_match_new_pos = 0
    local checkpoint = folder.get_checkpoint()
    local best_delta
    for i = 1, #struc do
      local term = struc[i]
      parse_result, new_s_pos = parse_func(term, s, s_pos)
      if
        parse_result and
        (new_s_pos > best_match_new_pos)
      then
        best_match_new_pos = new_s_pos
        best_delta = folder.get_delta(checkpoint)
      end
    end
    parse_result = (best_match_new_pos > 0)
    if parse_result then
      new_s_pos = best_match_new_pos
      folder.apply_delta(checkpoint, best_delta)
    else
      new_s_pos = s_pos
    end
    return parse_result, new_s_pos
  end
