return
  function(self, node)
    self.printer:add_curline('::')
    if not self:process_node(node.label) then
      return
    end
    self.printer:add_curline('::')
    return true
  end
