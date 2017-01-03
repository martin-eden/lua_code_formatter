return
  function(self, node)
    return
      {
        type = 'label_statement',
        label = self:process_node(node[1]),
      }
  end
