return
  function(self, s)
    if self.has_debt then
      self.text:add(self:get_indent())
      self.has_debt = false
    end
    self.text:add(s)
    self.on_clean_line = false
  end
