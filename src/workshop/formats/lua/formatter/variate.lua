local default_state = {is_multiline_allowed = true, is_last_hope = true}

return
  function(self, node, oneliner, multiliner)
    self.state_keeper:enter_level()
    local our_state = self.state_keeper:get_state() or default_state
    local is_multiline_allowed = our_state.is_multiline_allowed
    local is_last_hope = our_state.is_last_hope
    --[[
    print(
      'variate',
      node.type,
      oneliner and '1' or '.',
      multiliner and 'M' or '.',
      is_last_hope and 'H' or '.',
      is_multiline_allowed
    )
    --]]

    local last_hope_handler
    if multiliner and is_multiline_allowed then
      last_hope_handler = multiliner
    else
      last_hope_handler = oneliner
    end

    local result_representation
    local has_succeeded = false

    local do_represent =
      function(representer, is_multiline)
        local representer_is_last_hope =
          is_last_hope and
          (representer == last_hope_handler)

        self.state_keeper:set_child_state(
          {
            is_multiline_allowed = is_multiline,
            is_last_hope = representer_is_last_hope,
          }
        )

        local trial_representation, has_failed =
          self:represent(representer, node)
        if
          representer_is_last_hope or
          (
            not has_failed and
            self:representation_is_allowed(trial_representation)
          )
        then
          result_representation = trial_representation
          has_succeeded = true
        end
      end

    if oneliner then
      do_represent(oneliner, false)
    end
    if
      not result_representation and
      multiliner and
      is_multiline_allowed
    then
      do_represent(multiliner, true)
    end

    if result_representation then
      if not self.printer:on_clean_line() then
        --[[
          Current line is already in result as it was added
          in represent(). So remove it before concat with result.
        ]]
        self.printer.line_with_text.text = ''
      end
      self.printer:include(result_representation, true)
    end

    self.state_keeper:leave_level()

    return has_succeeded
  end
