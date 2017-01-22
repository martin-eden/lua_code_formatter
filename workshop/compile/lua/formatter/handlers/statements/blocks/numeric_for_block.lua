return
  function(self, node)
    self.printer:add_text('for ')
    self:process_node(node.index)
    self.printer:add_text(' = ')
    self:process_node(node.start_val)
    self.printer:add_text(', ')
    self:process_node(node.end_val)
    if node.increment then
      self.printer:add_text(', ')
      self:process_node(node.increment)
    end
    self.printer:add_text(' ')
    self:process_block_multiline('do', node.body, 'end')
  end
