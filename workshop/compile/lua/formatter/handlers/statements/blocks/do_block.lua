local multiliner =
  function(self, node)
    self:process_block_multiline('do', 'end', node[1])
  end

local variants =
  {
    {handle = multiliner, is_multiline = true},
  }

return
  function(self, node)
    self:variate(variants, node)
  end
