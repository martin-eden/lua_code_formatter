return
  function(self, start, len)
    local init_pos = self:get_position()
    self:set_position(start)
    local result = self:block_read(len)
    self:set_position(init_pos)
    return result
  end
