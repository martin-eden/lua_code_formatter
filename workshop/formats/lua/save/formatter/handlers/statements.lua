local multiliner =
  function(self, node)
    local printer = self.printer
    for i = 1, #node do
      self.printer:request_clean_line()
      if not self:process_node(node[i]) then
        return
      end
      -- self.printer:add_textline(';')
    end
    return true
  end

return
  function(self, node)
    return self:variate(node, nil, multiliner)
  end
