return
  function(self, node)
    node.name_list = node[1]
    node[1] = nil

    node.val_list = node[2]
    node[2] = nil
  end
