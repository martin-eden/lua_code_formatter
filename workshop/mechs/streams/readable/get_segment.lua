return
  function(self, start, len)
    local init_pos = self.position
    self.position = start
    local result = self:block_read(len)
    self.position = init_pos
    return result
  end
