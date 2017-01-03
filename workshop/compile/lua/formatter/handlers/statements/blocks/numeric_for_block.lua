local multiliner =
  function(self, node)
    self.printer:emit('for ')
    self:process_node(node.index)
    self.printer:emit(' = ')
    self:process_node(node.start_val)
    self.printer:emit(', ')
    self:process_node(node.end_val)
    if node.increment then
      self.printer:emit(', ')
      self:process_node(node.increment)
    end
    self.printer:emit(' ')
    self:process_block_multiline('do', 'end', node.body)
  end

local variants =
  {
    {handle = multiliner, is_multiline = true},
  }

return
  function(self, node)
    self:variate(variants, node)
  end
