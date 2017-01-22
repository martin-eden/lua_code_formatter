local multiliner =
  function(self, node)
    self.printer:add_text('function')
    self:process_node(node.params)
    self:process_block_multiline(nil, node.body, 'end')
  end

local variants =
  {
    {multiliner, is_multiline = true},
  }

return
  function(self, node)
    self:variate(variants, node)
  end
