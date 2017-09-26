return
  function(self, node)
    local result = {}

    if node[2] and (node[2].type ~= 'vararg') then
      local name_part = node[2]
      result = self:process_list(name_part)
    end

    if node[#node - 1] and (node[#node - 1].type == 'vararg') then
      local vararg = node[#node - 1]
      result[#result + 1] = self:process_node(vararg)
    end

    result.type = node.type

    return result
  end
