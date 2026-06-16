return
  function(self, rule)
    local rule_type = type(rule)
    if (rule_type == 'string') then
      return self.input_stream:match_string(rule)
    elseif (rule_type == 'function') then
      return rule(self.input_stream, self.output_stream)
    elseif (rule_type == 'table') then
      local op_neg = (rule.op == 'neg')
      local op_opt = (rule.op == 'opt')
      local f_rep = rule.f_rep
      if f_rep and op_neg then
        f_rep = nil
      end

      local rule_name = rule.name

      local result
      local repeat_result
      local mode_choice = rule.mode_choice
      local mode_seq = not mode_choice

      local input_stream = self.input_stream
      local output_stream = self.output_stream

      ::restart::
      local round_in_stream_pos = input_stream:get_position()
      local round_out_stream_pos = output_stream:get_position()

      if mode_seq then
        result = true
        for i = 1, #rule do
          if not self:match(rule[i]) then
            result = false
            break
          end
        end
      else
        -- mode_choice
        result = false
        for i = 1, #rule do
          if self:match(rule[i]) then
            result = true
            break
          end
        end
      end

      if not result then
        input_stream:set_position(round_in_stream_pos)
        output_stream:set_position(round_out_stream_pos)
      elseif rule_name then
        self.on_match(input_stream, output_stream, rule_name, round_in_stream_pos)
      end

      if f_rep then
        if result then
          repeat_result = true
          goto restart
        else
          result = repeat_result
        end
      end
      if op_opt then
        result = true
      elseif op_neg then
        result = not result
      end

      return result
    end
  end
