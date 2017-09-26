return
  function(self)
    local result = self.seq[self.position]
    self:set_position(self.position + 1)
    return result
  end
