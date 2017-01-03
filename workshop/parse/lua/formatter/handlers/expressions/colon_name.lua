return
  function(self, node)
    local result
    result = self:process_node(node[1])
    result.type = 'colon_name'
    return result
  end
