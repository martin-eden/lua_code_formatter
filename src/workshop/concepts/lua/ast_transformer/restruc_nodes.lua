return
  function(self, node)
    assert_table(node)

    for i = 1, #node do
      self:restruc_nodes(node[i])
    end

    local handler = self.handlers[node.type]
    if handler then
      handler(self, node)
    end
  end
