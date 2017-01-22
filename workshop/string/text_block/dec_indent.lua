return
  function(self)
    self.next_line_indent = self.next_line_indent - 1
    self:update_indent()
  end
