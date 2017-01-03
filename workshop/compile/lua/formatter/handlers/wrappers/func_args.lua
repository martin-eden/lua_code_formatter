return
  function(self, node)
    self.printer:emit('(')
    self:process_list(node, ', ')
    self.printer:emit(')')
  end
