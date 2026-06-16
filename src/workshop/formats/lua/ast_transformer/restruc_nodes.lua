local t2s = request('!.table.as_string')

return
  function(self, node)
    assert_table(node)
    -- print(node.type)

    for i = 1, #node do
      self:restruc_nodes(node[i])
    end

    local handler = self.handlers[node.type]
    if handler then
      -- print('', 'processing', node.type)
      handler(self, node)
      -- print(t2s(node))
    end
  end
