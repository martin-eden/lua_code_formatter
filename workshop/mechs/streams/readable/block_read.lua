return
  function(self, num_positions)
    local original_position = self.position
    local result = self:read(num_positions)
    local num_read = #result
    if (num_read < num_positions) then
      self.position = original_position
      return
    end
    return result
  end
