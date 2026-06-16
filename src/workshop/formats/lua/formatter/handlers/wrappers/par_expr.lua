local oneliner =
  function(self, node)
    self.printer:add_curline('(')
    if not self:process_node(node[1]) then
      return
    end
    self.printer:add_curline(')')
    return true
  end

local multiliner =
  function(self, node)
    self.printer:add_curline('(')

    self.printer:request_clean_line()
    if not self:process_block(node[1]) then
      return
    end

    self.printer:request_clean_line()
    self.printer:add_curline(')')

    return true
  end

return
  function(self, node)
    return self:variate(node, oneliner, multiliner)
  end
