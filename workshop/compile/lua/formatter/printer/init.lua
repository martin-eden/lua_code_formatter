return
  function(self)
    self.text:init()
    self.indent = 0
    self.has_debt = false
    self.on_clean_line = true
    self.variate_state =
      {
        is_multiline_allowed = true,
        is_failed_to_represent = false,
      }
  end
