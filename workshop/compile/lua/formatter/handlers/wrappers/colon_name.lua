return
  function(self, node)
    self.printer:emit(':')
    self.printer:emit(node.value)
  end
