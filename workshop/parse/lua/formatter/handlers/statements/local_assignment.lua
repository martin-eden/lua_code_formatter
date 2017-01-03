return
  function(self, node)
    return
      {
        type = 'local_assignment',
        name_list = self:process_node(node[1]),
        val_list = self:process_node(node[2]),
      }
  end
