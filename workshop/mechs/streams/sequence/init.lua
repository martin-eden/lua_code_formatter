return
  function(self, seq)
    assert_table(seq)
    self.seq = seq
    self.position = 1
  end
