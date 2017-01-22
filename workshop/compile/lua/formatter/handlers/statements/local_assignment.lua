return
  function(self, node)
    self.printer:add_text('local ')
    self:process_node(node.name_list)
    if node.val_list then
      self.printer:add_to_prev_text(' = ')
      self.printer:inc_indent()
      self:process_node(node.val_list)
      self.printer:dec_indent()
    end
  end
