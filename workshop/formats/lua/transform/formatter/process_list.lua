local process_node = request('process_node')

return
  function(self, node)
    local result = {}
    for i = 1, #node do
      result[i] = self:process_node(node[i])
    end
    result.type = node.type
    return result
  end
