return
  function(self, node)
    self:process_node(node.dest_list)
    self.printer:emit(' = ')
    self:process_node(node.val_list)
  end
