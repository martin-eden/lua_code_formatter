local oneliner =
  function(self, node)
    self.printer:add_curline('return ')
    return self:process_node(node[1])
  end

local multiliner =
  function(self, node)
    return self:process_block_multiline('return', node[1])
  end

return
  function(self, node)
    if not node[1] then
      self.printer:add_curline('return')
      return true
    else
      return self:variate(node, oneliner, multiliner)
    end
  end
