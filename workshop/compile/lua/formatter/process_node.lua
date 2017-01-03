return
  function(self, node)
    -- assert_table(node)
    if is_table(node) and node.type then
      local node_type = node.type or '?nil'
      local handler = self.handlers[node_type]
      if is_function(handler) then
        handler(self, node)
      else
        self.printer:emit('<' .. node_type .. '>')
      end
    end
  end
