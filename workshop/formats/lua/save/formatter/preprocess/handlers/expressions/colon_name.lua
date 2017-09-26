return
  function(self, node)
    local result = self:process_node(node[2])
    result.type = node.type
    return result
  end
