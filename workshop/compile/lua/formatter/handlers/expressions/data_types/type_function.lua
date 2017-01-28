local multiliner =
  function(self, node)
    local printer = self.printer

    printer:request_clean_line()
    printer:add_text('function')
    if not self:process_node(node.params) then
      return
    end

    printer:request_clean_line()
    return self:process_block_multiline(nil, node.body, 'end')
  end

return
  function(self, node)
    return self:variate(node, nil, multiliner)
  end
