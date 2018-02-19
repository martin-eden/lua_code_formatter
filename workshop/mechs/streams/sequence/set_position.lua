return
  function(self, new_position)
    if (new_position == self.position) then
      return
    end
    if (new_position < 1) then
      new_position = 1
    end
    if (new_position > self.position) then
      new_position = self.position
    end
    for i = new_position, self.position do
      self.seq[i] = nil
    end
    self.position = new_position
  end
