return
  function(self, node)
    return
      self:process_block_oneline('while ', node.condition, ' do') and
      self:process_block_multiline(nil, node.body, 'end')
  end
