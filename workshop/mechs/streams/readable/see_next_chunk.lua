return
  function(self)
    local pos = self.position
    local result = self:read(1)
    self.position = pos
    return result
  end
