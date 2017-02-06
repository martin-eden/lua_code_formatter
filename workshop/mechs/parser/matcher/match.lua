return
  function(self, rule)
    local stream = self.stream
    local rule_type = type(rule)
    if (rule_type == 'function') then
      return rule(stream)
    elseif (rule_type == 'string') then
      return stream:match(rule)
    elseif (rule_type == 'table') then
      local mode = rule.mode or 'seq'
      local handler = self.handlers[mode]

      local f_neg, f_opt, f_rep
      if rule.flags then
        f_neg = rule.flags.is_not
        f_opt = rule.flags.optional
        f_rep = rule.flags['repeat']
        if f_neg and f_opt then
          return true
        end
        if f_neg and f_rep then
          f_rep = nil
        end
      end

      local repeat_result

      ::restart::

      local init_position = stream:get_position()
      local result = handler(self, rule)
      if not result then
        stream:set_position(init_position)
      else
        if rule.name then
          local cur_position = stream:get_position()
          self:on_match(init_position, cur_position, rule.name)
        end
      end

      if f_rep then
        if result then
          repeat_result = true
          goto restart
        else
          result = repeat_result
        end
      end
      if f_opt then
        return true
      end
      if f_neg then
        return not result
      end

      return result
    end
  end
