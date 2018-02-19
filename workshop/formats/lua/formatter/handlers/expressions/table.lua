local oneliner =
  function(self, node)
    local printer = self.printer
    printer:add_curline('{')
    for i = 1, #node do
      if (i > 1) then
        printer:add_curline(', ')
      end
      local key, value = node[i].key, node[i].value
      if key then
        if not self:process_node(key) then
          return
        end
        printer:add_curline(' = ')
      end
      if not self:process_node(value) then
        return
      end
    end
    printer:add_curline('}')
    return true
  end

local multiliner =
  function(self, node)
    local printer = self.printer

    printer:request_clean_line()
    printer:add_curline('{')

    printer:inc_indent()
    for i = 1, #node do
      printer:request_clean_line()
      local key, value = node[i].key, node[i].value
      if key then
        if not self:process_node(key) then
          return
        end
        printer:add_curline(' = ')
        if not self:process_block(value) then
          return
        end
        printer:add_textline(',')
      else
        if not self:process_node(value) then
          return
        end
        printer:add_textline(',')
      end
    end
    printer:dec_indent()

    printer:request_clean_line()
    printer:add_curline('}')
    return true
  end

return
  function(self, node)
    if (#node == 0) then
      self.printer:add_curline('{}')
      return true
    else
      return self:variate(node, oneliner, multiliner)
    end
  end
