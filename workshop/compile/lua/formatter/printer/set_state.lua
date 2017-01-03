return
  function(self, state)
    self.indent = state.indent
    self.has_debt = state.has_debt
    self.variate_state.is_multiline_allowed = state.variate_state.is_multiline_allowed
    self.variate_state.is_failed_to_represent = state.variate_state.is_failed_to_represent
    self.on_clean_line = state.on_clean_line
  end
