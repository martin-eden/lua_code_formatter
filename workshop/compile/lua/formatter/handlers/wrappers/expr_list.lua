local oneliner =
  function(self, node)
    self:process_list(node, ', ')
  end

local add_delimiter_multiline =
  function(self)
    self.printer:add_to_prev_text(',')
    self.printer:request_clean_line()
  end

local multiliner =
  function(self, node)
    self.printer:request_clean_line()
    self:process_list(node, add_delimiter_multiline)
  end

local variants =
  {
    {multiliner, is_multiline = true},
    oneliner,
  }

return
  function(self, node)
    self:variate(variants, node)
  end
