--[[
  opt_rep <un_op>
  cho(
          <vararg>
          <type_nil>
          <type_boolean>
          <type_number>
          <type_string>
          <type_table>
          <type_function>
     )    <var_link>
  opt_rep
          <bin_op>
          <expression>
]]

return
  function(self, node)
    local result = {}

    local i = 1
    while (i <= #node) do
      local term = {}

      if (node[1].type == 'un_op') then
        local un_ops = {}
        while (i <= #node) and (node[i].type == 'un_op') do
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

      if (i <= #node) and (node[i].type == 'expression') then
        node = node[i]
        i = 1
      end
    end
    result.type = node.type

    return result
  end
