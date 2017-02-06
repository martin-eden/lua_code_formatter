return
  function(self, node, deep, parent_type)
    local quoted_node = self.quote_string(node)
    if
      (parent_type == 'indexed_key') and
      quoted_node:sub(1, 1) == '['
    then
      -- Avoiding "[[[long_string]]] = 'some_value'" syntax clash
      self.string_adder:add(' ')
    end
    self.string_adder:add(quoted_node)
  end
