return
  function(self, node)
    if is_table(node) and node.type then
      local node_type = node.type or '?nil'
      local handler = self.handlers[node_type]
      if is_function(handler) then
        return handler(self, node)
      else
        self.printer:add_text('<' .. node_type .. '>')
        return
      end
    end
    return true
  end
