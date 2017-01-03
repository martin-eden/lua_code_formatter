return
  function(self, node)
    self.printer:emit('local ')
    self:process_node(node.name_list)
    if node.val_list then
      self.printer:emit(' = ')
      self:process_node(node.val_list)
    end
  end
