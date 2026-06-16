return
  function(self, new_position)
    if (new_position == self.position) then
      return
    end
    if (new_position < 1) then
      new_position = 1
    elseif (new_position > #self.s + 1) then
      new_position = #self.s + 1
    end
    self.position = new_position
  end
