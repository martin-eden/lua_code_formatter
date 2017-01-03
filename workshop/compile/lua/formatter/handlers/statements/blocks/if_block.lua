local oneliner = request('if_block.oneline')
local multiliner = request('if_block.multiline')

local variants =
  {
    {handle = multiliner, is_multiline = true},
    {handle = oneliner},
  }

return
  function(self, node)
    self:variate(variants, node)
  end
