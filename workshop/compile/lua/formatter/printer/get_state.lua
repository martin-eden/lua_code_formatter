return
  function(self)
    return
      {
        indent = self.indent,
        has_debt = self.has_debt,
        on_clean_line = self.on_clean_line,
        variate_state =
          {
            is_multiline_allowed = self.variate_state.is_multiline_allowed,
            is_failed_to_represent = self.variate_state.is_failed_to_represent,
          },
      }
  end
