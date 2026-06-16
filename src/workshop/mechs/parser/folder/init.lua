return
  function(self, struc)
    assert_table(struc)
    self.struc = struc
    self.is_folded = false
  end
