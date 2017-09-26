return
  function(input_stream, output_stream, rule_name, init_in_stream_pos)
    local len = input_stream:get_position() - init_in_stream_pos
    if (len > 0) then
      output_stream:write(
        {
          start = init_in_stream_pos,
          len = len,
          type = rule_name,
        }
      )
    end
  end
