local oneliner =
  function(self, node)
    self.printer:add_text('(')
    if not self:process_node(node.expr) then
      return
    end
    self.printer:add_text(')')
    return true
  end

local multiliner =
  function(self, node)
    self.printer:add_text('(')

    self.printer:request_clean_line()
    if not self:process_block(node.expr) then
      return
    end

    self.printer:request_clean_line()
    self.printer:add_text(')')

    return true
  end

return
  function(self, node)
    return self:variate(node, oneliner, multiliner)
  end
