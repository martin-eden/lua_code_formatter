--[[
  Change/remove some nodes of AST.

  Removed nodes:
    * string elements
    * <whitespace>

  Changed nodes:
    * <.value> added for nodes with single string element
    * <assign_or_call> - exact type resolved. Subnode may sink up.
    * <var_or_call> - exact type resolved
    * <local_statement> - exact type resolved. Subnode sinks up.
]]

local replace = request('!.table.replace')

return
  function(self, node)
    local node_value
    local num_str_values = 0

    for i = #node, 1, -1 do
      local child_node = node[i]
      if is_string(child_node) then
        num_str_values = num_str_values + 1
        if (num_str_values == 1) then
          node_value = child_node
        end
        table.remove(node, i)
      elseif (child_node.type == 'whitespace') then
        table.remove(node, i)
      else
        self:align_nodes(child_node)
      end
    end

    if (num_str_values == 1) then
      node.value = node_value
    end

    if (node.type == 'assign_or_call') then
      if (node[1].type == 'function_call') then
        replace(node, node[1])
      else
        node.type = 'assignment'
      end
    elseif (node.type == 'var_or_call') then
      if (node[#node].type == 'func_args') then
        node.type = 'function_call'
      else
        node.type = 'var_ref'
      end
    elseif (node.type == 'local_statement') then
      replace(node, node[1])
      if (node.type == 'named_function') then
        node.type = 'local_named_function'
      else
        node.type = 'local_assignment'
      end
    end
  end
