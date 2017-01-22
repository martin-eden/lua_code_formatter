return
  function(self, node)
    self.printer:add_text('::')
    self:process_node(node.label)
    self.printer:add_text('::')
  end
