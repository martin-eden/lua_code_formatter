local oneliner =
  function(self, node)
    self.printer:add_curline('return ')
    return self:process_node(node.expr_list)
  end

local multiliner =
  function(self, node)
    return self:process_block_multiline('return', node.expr_list)
  end

return
  function(self, node)
    if not node.expr_list then
      self.printer:add_curline('return')
      return true
    else
      return self:variate(node, oneliner, multiliner)
    end
  end
