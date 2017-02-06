return
  function(self, node)
    local result = {}
    result.type = 'repeat_block'
    local condition_index
    if (node[1].type == 'statements') then
      result.body = self:process_node(node[1])
      condition_index = 2
    else
      condition_index = 1
    end
    result.condition = self:process_node(node[condition_index])
    return result
  end
