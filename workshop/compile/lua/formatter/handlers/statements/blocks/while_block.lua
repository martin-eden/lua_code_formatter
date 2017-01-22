return
  function(self, node)
    self:process_block_oneline('while ', node.condition, ' do')
    self:process_block_multiline(nil, node.body, 'end')
  end
