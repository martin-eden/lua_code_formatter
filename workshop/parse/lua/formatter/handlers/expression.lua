return
  function(self, node)
    local result = {}

    local i = 1
    while (i <= #node) do
      local term = {}

      if (node[1].name == 'un_op') then
        local un_ops = {}
        while (i <= #node) and (node[i].name == 'un_op') do
          un_ops[#un_ops + 1] = self:process_node(node[i]).value
          i = i + 1
        end
        term.un_ops = un_ops
      end

      term.operand = self:process_node(node[i])
      i = i + 1

      if (i <= #node) then
        term.bin_op = self:process_node(node[i]).value
        i = i + 1
      end

      result[#result + 1] = term

      if (i <= #node) and (node[i].name == 'expression') then
        node = node[i]
        i = 1
      end
    end
    result.type = 'expression'

    return result
  end
