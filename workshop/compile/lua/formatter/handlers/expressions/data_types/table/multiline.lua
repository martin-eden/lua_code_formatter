return
  function(self, node)
    local printer = self.printer
    if (#node == 0) then
      printer:emit('{}')
      return
    end
    printer:emit('{')
    printer:emit_nl()
    printer:inc_indent()
    for i = 1, #node do
      local key, value = node[i].key, node[i].value
      if key then
        self:process_node(key)
        printer:emit(' = ')
      end
      self:process_node(value)
      printer:emit(';')
      printer:emit_nl()
    end
    printer:dec_indent()
    printer:emit('}')
  end
