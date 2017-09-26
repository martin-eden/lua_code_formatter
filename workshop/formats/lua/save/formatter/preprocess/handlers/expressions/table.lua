return
  function(self, node)
    local result = self:process_list(node)
    result.type = node.type
    return result
  end
