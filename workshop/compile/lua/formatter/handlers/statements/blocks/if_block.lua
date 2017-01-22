local oneline_if =
  function(self, node)
    self:process_block_oneline('if ', node, ' then')
  end

local multiline_if =
  function(self, node)
    self:process_block_multiline('if', node, 'then')
  end

local if_variants =
  {
    {multiline_if, is_multiline = true},
    oneline_if,
  }

local oneline_elseif =
  function(self, node)
    self:process_block_oneline('elseif ', node, ' then')
  end

local multiline_elseif =
  function(self, node)
    self:process_block_multiline('elseif', node, 'then')
  end

local elseif_variants =
  {
    {multiline_elseif, is_multiline = true},
    oneline_elseif,
  }

return
  function(self, node)
    local printer = self.printer

    printer:request_clean_line()
    self:variate(if_variants, node.if_part.condition)
    self:process_block_multiline(nil, node.if_part.body)

    if node.elseif_parts then
      for i = 1, #node.elseif_parts do
        printer:request_clean_line()
        self:variate(elseif_variants, node.elseif_parts[i].condition)
        self:process_block_multiline(nil, node.elseif_parts[i].body)
      end
    end

    if node.else_part then
      printer:request_clean_line()
      self:process_block_multiline('else', node.else_part.body)
    end

    printer:request_clean_line()
    self.printer:add_text('end')
  end
