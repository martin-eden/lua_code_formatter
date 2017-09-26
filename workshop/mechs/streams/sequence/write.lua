return
  function(self, value)
    self.seq[self.position] = value
    self.position = self.position + 1
  end
