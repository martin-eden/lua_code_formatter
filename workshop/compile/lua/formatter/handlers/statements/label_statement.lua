return
  function(self, node)
    self.printer:emit('::')
    self:process_node(node.label)
    self.printer:emit('::')
  end
