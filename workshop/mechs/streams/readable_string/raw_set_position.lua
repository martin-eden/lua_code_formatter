return
  function(self, new_position)
    new_position = math.max(new_position, 1)
    new_position = math.min(new_position, #self.s + 1)
    self.position = new_position
  end
