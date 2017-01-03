return
  function(self, node)
    self.printer:emit('[')
    local orig_type = node.type
    node.type = 'expression'
    self:process_node(node)
    node.type = orig_type
    self.printer:emit(']')
  end
