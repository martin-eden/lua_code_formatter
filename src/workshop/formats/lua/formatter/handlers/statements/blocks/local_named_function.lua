return
  function(self, node)
    local printer = self.printer

    printer:request_empty_line()
    printer:add_curline('local function ')
    if not self:process_node(node.dotted_name) then
      return
    end
    if not self:process_node(node.params) then
      return
    end

    printer:request_clean_line()
    if not self:process_block_multiline(nil, node.body, 'end') then
      return
    end

    printer:request_empty_line()
    return true
  end
