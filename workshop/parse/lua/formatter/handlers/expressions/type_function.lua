return
  function(self, node)
    local result = {}
    result.params = self:process_node(node[1])
    if node[2] then
      result.body = self:process_node(node[2])
    end
    result.type = 'type_function'
    return result
  end
