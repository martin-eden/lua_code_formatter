return
  function(self, node, alternate_handler)
    local result
    self.printer:inc_indent()
    if alternate_handler then
      result = alternate_handler(self, node)
    else
      result = self:process_node(node)
    end
    self.printer:dec_indent()
    return result
  end
