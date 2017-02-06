local header_oneline =
  function(self, node)
    local printer = self.printer
    printer:add_curline('for ')
    if not self:process_node(node.names) then
      return
    end
    printer:add_curline(' in ')
    if not self:process_node(node.expr_list) then
      return
    end
    printer:add_curline(' do')
    return true
  end

local in_part_oneline =
  function(self, node)
    self.printer:add_curline(' in ')
    return self:process_node(node.expr_list)
  end

local in_part_multiline =
  function(self, node)
    self.printer:add_textline(' in')

    self.printer:request_clean_line()
    return self:process_block(node.expr_list)
  end

local header_multiline =
  function(self, node)
    local printer = self.printer
    printer:add_curline('for')

    printer:request_clean_line()
    printer:inc_indent()
    if not self:process_node(node.names) then
      return
    end
    if not self:variate(node, in_part_oneline, in_part_multiline) then
      return
    end
    printer:dec_indent()

    printer:request_clean_line()
    printer:add_curline('do')
    return true
  end

local multiliner =
  function(self, node)
    local printer = self.printer

    printer:request_clean_line()
    if not self:variate(node, header_oneline, header_multiline) then
      return
    end

    printer:request_clean_line()
    if not self:process_block(node.body) then
      return
    end

    printer:request_clean_line()
    printer:add_curline('end')

    return true
  end

return
  function(self, node)
    return self:variate(node, nil, multiliner)
  end
