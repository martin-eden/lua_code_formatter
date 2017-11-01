return
  function(self, new_position)
    if (new_position == self.position) then
      return
    end
    if (new_position < 1) then
      new_position = 1
    elseif (new_position > self.position + 1) then
      new_position = self.position + 1
    end
    if (new_position < self.position) then
      for i = new_position + 1, self.position do
        self.seq[i] = nil
      end
    end
    self.position = new_position
  end
