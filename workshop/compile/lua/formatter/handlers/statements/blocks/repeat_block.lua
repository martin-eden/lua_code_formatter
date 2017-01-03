local multiliner =
  function(self, node)
    self:process_block_multiline('repeat', 'until', node.body)
    self.printer:emit(' ')
    self:process_node(node.condition)
  end

local variants =
  {
    {handle = multiliner, is_multiline = true},
  }

return
  function(self, node)
    self:variate(variants, node)
  end
