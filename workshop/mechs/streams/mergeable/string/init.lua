return
  function(self, s)
    assert_string(s)
    self.s = s
    self.position = 1
    self:original_init()
  end
