return
  function(self, num_positions)
    local original_position = self:get_position()
    local result, num_read = self:read(num_positions)
    if (num_read < num_positions) then
      self:set_position(original_position)
      return
    end
    return result
  end
