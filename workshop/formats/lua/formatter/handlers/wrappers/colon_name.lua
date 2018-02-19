return
  function(self, node)
    self.printer:add_curline(':')
    return self:process_node(node[1])
  end
