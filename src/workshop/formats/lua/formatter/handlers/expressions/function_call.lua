return
  function(self, node)
    return
      self:process_node(node.name_part) and
      self:process_node(node.args)
  end
