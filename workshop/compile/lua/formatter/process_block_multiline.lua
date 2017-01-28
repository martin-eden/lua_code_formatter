return
  function(self, prefix, node, postfix, alternate_handler)
    local printer = self.printer

    if prefix then
      printer:add_text(prefix)
    end

    printer:request_clean_line()
    local result = self:process_block(node, alternate_handler)

    if postfix then
      printer:request_clean_line()
      printer:add_text(postfix)
    end

    return result
  end
