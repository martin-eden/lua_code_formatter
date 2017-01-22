local oneliner =
  function(self, node)
    self.printer:add_text('(')
    self:process_list(node, ', ')
    self.printer:add_text(')')
  end

local add_delimiter_multiline =
  function(self)
    self.printer:add_to_prev_text(',')
    self.printer:request_clean_line()
  end

local multiliner_list_processor =
  function(self, node)
    self:process_list(node, add_delimiter_multiline)
  end

local multiliner =
  function(self, node)
    self:process_block_multiline('(', node, ')', multiliner_list_processor)
  end

local variants =
  {
    {multiliner, is_multiline = true},
    oneliner,
  }

return
  function(self, node)
    if (#node == 0) then
      self.printer:add_text('()')
    else
      self:variate(variants, node)
    end
  end
