local multiliner =
  function(self, node)
    self.printer:request_clean_line()
    self.printer:emit_nl()
    self.printer:emit('local function ')
    self:process_node(node.dotted_name)
    self:process_node(node.params)
    self:process_block_multiline(nil, 'end', node.body)
  end

local variants =
  {
    {handle = multiliner, is_multiline = true},
  }

return
  function(self, node)
    self:variate(variants, node)
  end
