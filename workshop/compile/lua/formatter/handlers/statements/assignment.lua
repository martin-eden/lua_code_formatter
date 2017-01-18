local oneliner =
  function(self, node)
    self:process_node(node.dest_list)
    self.printer:emit(' = ')
    self:process_node(node.val_list)
  end

local multiliner =
  function(self, node)
    self:process_node(node.dest_list)
    local printer = self.printer
    printer:emit(' =')
    printer:emit_nl()
    printer:inc_indent()
    self:process_node(node.val_list)
    printer:dec_indent()
  end

local variants =
  {
    {multiliner, is_multiline = true},
    oneliner,
  }

return
  function(self, node)
    self:variate(variants, node)
  end
