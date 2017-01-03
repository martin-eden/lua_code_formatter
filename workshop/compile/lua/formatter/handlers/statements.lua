local multiliner =
  function(self, node)
    self:process_list(node, self.printer.emit_nl)
  end

local variants =
  {
    {handle = multiliner, is_multiline = true},
  }

return
  function(self, node)
    self:variate(variants, node)
  end
