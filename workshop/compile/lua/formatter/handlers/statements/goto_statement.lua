return
  function(self, node)
    self.printer:add_text('goto ')
    self:process_node(node.label)
  end
