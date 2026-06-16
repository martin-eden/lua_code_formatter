return
  function(self, node)
    self.printer:add_curline('goto ')
    return self:process_node(node[1])
  end
