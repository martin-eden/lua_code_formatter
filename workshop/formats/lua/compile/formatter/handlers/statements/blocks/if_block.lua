local oneline_if =
  function(self, node)
    return self:process_block_oneline('if ', node, ' then')
  end

local multiline_if =
  function(self, node)
    return self:process_block_multiline('if', node, 'then')
  end

local oneline_elseif =
  function(self, node)
    return self:process_block_oneline('elseif ', node, ' then')
  end

local multiline_elseif =
  function(self, node)
    return self:process_block_multiline('elseif', node, 'then')
  end

return
  function(self, node)
    local printer = self.printer

    printer:request_clean_line()
    if not self:variate(node.if_part.condition, oneline_if, multiline_if) then
      return
    end

    printer:request_clean_line()
    if not self:process_block(node.if_part.body) then
      return
    end

    if node.elseif_parts then
      for i = 1, #node.elseif_parts do
        printer:request_clean_line()
        if
          not self:variate(
            node.elseif_parts[i].condition,
            oneline_elseif,
            multiline_elseif
          )
        then
          return
        end

        printer:request_clean_line()
        if not self:process_block(node.elseif_parts[i].body) then
          return
        end
      end
    end

    if node.else_part then
      printer:request_clean_line()
      if not self:process_block_multiline('else', node.else_part.body) then
        return
      end
    end

    printer:request_clean_line()
    self.printer:add_curline('end')
    return true
  end
