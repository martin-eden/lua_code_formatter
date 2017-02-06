return
  function(self, node)
    local result =
      {
        type = 'bracket_expr',
        expr = self:process_node(node[1]),
      }
    return result
  end
