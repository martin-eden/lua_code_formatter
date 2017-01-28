return
  function(self, node)
    if not self:process_node(node.dest_list) then
      return
    end
    if node.val_list then
      self.printer:add_to_prev_text(' = ')
      return self:process_block(node.val_list)
    end
    return true
  end
