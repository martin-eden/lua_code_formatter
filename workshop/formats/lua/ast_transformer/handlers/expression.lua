--[[
  rep

    opt_rep <un_op>

    cho     <vararg>
            <type_nil>
            <type_boolean>
            <type_number>
            <type_string>
            <type_table>
            <type_function>
            <var_ref>

    opt     <bin_op>
]]

local replace = request('!.table.replace')

return
  function(self, node)
    local result = {}

    local i = 1

    local n = #node

    local term = {}

    if (node[i].type == 'un_op') then
      local un_ops = {}
      while (node[i].type == 'un_op') and (i <= n) do
        un_ops[#un_ops + 1] = node[i].value
        node[i] = nil
        i = i + 1
      end
      term.un_ops = un_ops
    end

    term.operand = node[i]
    node[i] = nil
    i = i + 1

    if (i < n) and (node[i].type == 'bin_op') then
      term.bin_op = node[i].value
      node[i] = nil
      i = i + 1
    end

    result[#result + 1] = term

    if (i == n) and (node[i].type == 'expression') then
      -- Last node is already processed record. Due align_nodes() construction.
      for j = 1, #node[i] do
        result[#result + 1] = node[i][j]
      end
      node[i] = nil
    end

    result.type = node.type

    replace(node, result)
  end
