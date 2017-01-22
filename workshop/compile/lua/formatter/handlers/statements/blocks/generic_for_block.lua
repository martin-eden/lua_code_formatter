return
  function(self, node)
    self:process_block_oneline('for ', node.names, ' in ')
    self:process_block_oneline(nil, node.expr_list, ' do')
    self:process_block_multiline(nil, node.body, 'end')
  end
