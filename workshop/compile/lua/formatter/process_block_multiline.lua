--[[
  Process indent block with multi-line style.

  multiline samples:
    do
      <>
    end

    return
      <>
]]

return
  function(self, prefix, node, postfix, alternate_handler)
    local printer = self.printer

    if prefix then
      printer:add_text(prefix)
    end

    printer:request_clean_line()
    printer:inc_indent()
    if alternate_handler then
      alternate_handler(self, node)
    else
      self.process_node(self, node)
    end
    printer:dec_indent()
    printer:request_clean_line()

    if postfix then
      printer:add_text(postfix)
    end
  end
