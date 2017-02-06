return
  function(self, node)
    return
      {
        type = 'else_part',
        body = self:process_node(node[1]),
      }
  end
