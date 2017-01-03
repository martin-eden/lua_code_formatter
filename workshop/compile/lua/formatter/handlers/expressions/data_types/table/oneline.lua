return
  function(self, node)
    self.printer:emit('{')
    for i = 1, #node do
      if (i > 1) then
        self.printer:emit(', ')
      end
      local key, value = node[i].key, node[i].value
      if key then
        self:process_node(key)
        self.printer:emit(' = ')
      end
      self:process_node(value)
    end
    self.printer:emit('}')
  end
