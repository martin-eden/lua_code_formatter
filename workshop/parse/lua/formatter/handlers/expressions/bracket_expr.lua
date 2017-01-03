return
  function(self, node)
    local result
    result = self:process_node(node[1])
    result.type = 'bracket_expr'
    return result
  end
