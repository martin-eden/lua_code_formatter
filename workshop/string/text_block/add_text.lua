local trim_head_spaces = request('^.trim_head_spaces')

return
  function(self, s)
    s = s or ''
    if self:on_clean_line() then
      s = trim_head_spaces(s)
    end
    self.lines[#self.lines] = (self.lines[#self.lines] or '') .. s
  end
