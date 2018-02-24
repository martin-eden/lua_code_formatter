return
  function(self)
    self.printer.indent_chunk = self.indent_chunk
    self.printer:init()
    self.state_keeper:init()

    assert_table(self.data_struc)
  end
