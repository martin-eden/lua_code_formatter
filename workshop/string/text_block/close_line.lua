local trim_tail_spaces = request('^.trim_tail_spaces')

return
  function(self)
    self.lines[#self.lines] = trim_tail_spaces(self.lines[#self.lines])
    self.lines[#self.lines + 1] = ''
    self:update_indent()
  end
