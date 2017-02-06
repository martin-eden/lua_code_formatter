return
  function(self, str)
    local init_pos = self.position
    local segment = self:block_read(#str)
    local result = segment and (segment == str)
    if not result then
      self.position = init_pos
    end
    return result
  end
