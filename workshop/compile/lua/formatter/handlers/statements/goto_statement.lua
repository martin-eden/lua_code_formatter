return
  function(self, node)
    self.printer:emit('goto ')
    self:process_node(node.label)
  end
