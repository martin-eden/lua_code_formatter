return
  function(self, num_positions)
    local result = self.s:sub(self.position, self.position + num_positions - 1)
    -- print(('raw_read [%d, %d, "%s"]'):format(self:get_position(), num_positions, result))
    self:set_relative_position(num_positions)
    return result
  end
