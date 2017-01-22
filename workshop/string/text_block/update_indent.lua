return
  function(self)
    if self:on_clean_line() then
      self.line_indents[#self.lines] = self.next_line_indent
    end
  end
