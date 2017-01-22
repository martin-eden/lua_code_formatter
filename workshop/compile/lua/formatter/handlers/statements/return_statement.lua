local oneliner =
  function(self, node)
    self.printer:add_text('return ')
    self:process_node(node.expr_list)
  end

local multiliner =
  function(self, node)
    self:process_block_multiline('return', node.expr_list)
  end

local variants =
  {
    {multiliner, is_multiline = true},
    oneliner,
  }

return
  function(self, node)
    if not node.expr_list then
      self.printer:add_text('return')
    else
      self:variate(variants, node)
    end
  end
