return
  function(self, node)
    local result = {}

    result.params = self:process_node(node[2])

    if node[3] then
      result.body = self:process_node(node[3])
    end

    return result
  end
