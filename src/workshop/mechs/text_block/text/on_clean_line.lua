return
  function(self)
    return
      (self.num_line_feeds > 0) or
      (
        (self.num_line_feeds == 0) and
        (self.line_with_text.text == '')
      )
  end
