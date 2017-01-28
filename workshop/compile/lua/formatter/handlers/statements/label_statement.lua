return
  function(self, node)
    self.printer:add_text('::')
    if not self:process_node(node.label) then
      return
    end
    self.printer:add_text('::')
    return true
  end
