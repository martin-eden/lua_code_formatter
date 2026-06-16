return
  function(self, node)
    self.printer:add_curline('local ')
    if not self:process_block(node.name_list) then
      return
    end
    if node.val_list then
      self.printer:add_textline(' = ')
      return self:process_block(node.val_list)
    end
    return true
  end
