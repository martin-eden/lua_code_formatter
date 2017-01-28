local oneline_delimiter = ', '

local oneliner =
  function(self, node)
    self.printer:add_text('(')
    if not self:process_list(node, oneline_delimiter) then
      return
    end
    self.printer:add_text(')')
    return true
  end

local multiline_delimiter =
  function(self)
    self.printer:add_to_prev_text(',')
    self.printer:request_clean_line()
  end

local multiline_block_processor =
  function(self, node)
    return self:process_list_variative(node, oneline_delimiter, multiline_delimiter)
  end

local multiliner =
  function(self, node)
    self.printer:add_text('(')
    self.printer:request_clean_line()
    if not self:process_block(node, multiline_block_processor) then
      return
    end
    self.printer:request_clean_line()
    self.printer:add_text(')')
    return true
  end

return
  function(self, node)
    if (#node == 0) then
      self.printer:add_text('()')
      return true
    else
      return self:variate(node, oneliner, multiliner)
    end
  end
