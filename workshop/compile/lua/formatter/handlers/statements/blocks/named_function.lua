local multiliner =
  function(self, node)
    self.printer:request_clean_line()
    self.printer:emit_nl()
    self.printer:emit('function ')
    self:process_node(node.dotted_name)
    if node.colon_name then
      self:process_node(node.colon_name)
    end
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
