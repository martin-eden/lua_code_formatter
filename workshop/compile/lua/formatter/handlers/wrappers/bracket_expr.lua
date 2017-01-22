return
  function(self, node)
    local orig_type = node.type
    node.type = 'expression'

    self.printer:add_text('[')
    self:process_node(node)
    self.printer:add_text(']')

    node.type = orig_type
  end
