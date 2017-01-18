local oneliner = request('table.oneline')
local multiliner = request('table.multiline')

local variants =
  {
    {multiliner, is_multiline = true},
    oneliner,
  }

return
  function(self, node)
    self:variate(variants, node)
  end
