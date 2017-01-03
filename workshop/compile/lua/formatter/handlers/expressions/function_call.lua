return
  function(self, node)
    self:process_node(node.name_part)
    self:process_node(node.args)
  end
