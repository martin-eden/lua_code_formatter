return
  function(self, node)
    self.printer:add_text('goto ')
    return self:process_node(node.label)
  end
