local oneliner = request('table.oneline')
local multiliner = request('table.multiline')

local variants =
  {
    {handle = multiliner, is_multiline = true},
    {handle = oneliner},
  }

return
  function(self, node)
    self:variate(variants, node)
  end
