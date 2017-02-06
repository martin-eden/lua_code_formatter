return
  function(self, num_positions)
    if (self.position ~= self:raw_get_position()) then
      self:raw_set_position(self.position)
      self.position = self:raw_get_position()
    end
    if (num_positions == 1) then
      local pos = self.position
      if self.cached_chunks[pos] then
        self.position = self.position + 1
      else
        self.cached_chunks[pos] = self:raw_read(1)
      end
      return self.cached_chunks[pos]
    else
      return self:raw_read(num_positions)
    end
  end
