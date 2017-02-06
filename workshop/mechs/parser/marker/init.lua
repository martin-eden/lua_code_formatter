return
  function(self, ...)
    self.marks = {}
    self:original_init(...)
  end
