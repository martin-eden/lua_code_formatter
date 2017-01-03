return
  function(self, node)
    local result
    if node[1] then
      result = self:process_node(node[1])
    else
      result = {}
    end
    result.type = 'do_block'
    return result
  end
