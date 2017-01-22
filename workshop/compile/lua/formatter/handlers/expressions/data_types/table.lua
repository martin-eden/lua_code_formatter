local oneliner =
  function(self, node)
    local printer = self.printer
    printer:add_text('{')
    for i = 1, #node do
      if (i > 1) then
        printer:add_text(', ')
      end
      local key, value = node[i].key, node[i].value
      if key then
        self:process_node(key)
        printer:add_text(' = ')
      end
      self:process_node(value)
    end
    printer:add_text('}')
  end

local multiliner_process_table =
  function(self, node)
    local printer = self.printer
    for i = 1, #node do
      printer:request_clean_line()
      local key, value = node[i].key, node[i].value
      if key then
        self:process_node(key)
        printer:add_text(' = ')
        printer:inc_indent()
        self:process_node(value)
        printer:dec_indent()
        printer:add_to_prev_text(';')
      else
        self:process_node(value)
        printer:add_to_prev_text(';')
      end
    end
  end

local multiliner =
  function(self, node)
    self:process_block_multiline('{', node, '}', multiliner_process_table)
  end

local variants =
  {
    {multiliner, is_multiline = true},
    oneliner,
  }

return
  function(self, node)
    if (#node == 0) then
      self.printer:add_text('{}')
    else
      self:variate(variants, node)
    end
  end
