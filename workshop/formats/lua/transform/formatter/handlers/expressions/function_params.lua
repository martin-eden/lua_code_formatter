return
  function(self, node)
    local result = {}
    local name_part = node[1] and (node[1].type ~= 'vararg') and node[1]
    local vararg = node[#node] and (node[#node].type == 'vararg') and node[#node]
    if name_part then
      result = self:process_list(name_part)
    end
    if vararg then
      result[#result + 1] = self:process_node(vararg)
    end
    result.type = 'function_params'
    return result
  end
