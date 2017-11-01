return
  function(self, node)
    self.printer:add_curline(':')
    self.printer:add_curline(node.value)
    return true
  end
