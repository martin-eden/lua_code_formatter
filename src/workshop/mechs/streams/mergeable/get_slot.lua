return
  function(self)
    local init_pos = self:get_position()
    local result = self:block_read(1)
    self:set_position(init_pos)
    return result
  end
