return
  function(self, node)
    local result =
      {
        type = 'goto_statement',
        label = self:process_node(node[1]),
      }
    return result
  end
