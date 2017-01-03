local multiliner =
  function(self, node)
    self:process_block_oneline('while', nil, node.condition)
    self:process_block_multiline('do', 'end', node.body)
  end

local variants =
  {
    {handle = multiliner, is_multiline = true},
  }

return
  function(self, node)
    self:variate(variants, node)
  end
