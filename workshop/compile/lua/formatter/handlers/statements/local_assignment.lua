local oneliner =
  function(self, node)
    self.printer:emit('local ')
    self:process_node(node.name_list)
    if node.val_list then
      self.printer:emit(' = ')
      self:process_node(node.val_list)
    end
  end

local multiliner =
  function(self, node)
    local printer = self.printer
    printer:emit('local ')
    self:process_node(node.name_list)
    if node.val_list then
      printer:emit(' =')
      printer:emit_nl()
      printer:inc_indent()
      self:process_node(node.val_list)
      printer:dec_indent()
    end
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
