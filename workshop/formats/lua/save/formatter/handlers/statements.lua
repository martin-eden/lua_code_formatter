--[[
  Handle sequence of statements.

  Each statement starts with new line, except <empty_statement> ";".
]]

local multiliner =
  function(self, node)
    local printer = self.printer
    for i = 1, #node do
      if (node[i].type ~= 'empty_statement') then
        self.printer:request_clean_line()
      end
      if not self:process_node(node[i]) then
        return
      end
    end
    return true
  end

return
  function(self, node)
    return self:variate(node, nil, multiliner)
  end
