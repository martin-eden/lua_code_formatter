local place_delimiter =
  function(self)
    self.printer:add_to_prev_text(';')
    self.printer:request_clean_line()
  end

return
  function(self, node)
    self:process_list(node, place_delimiter, true)
  end
