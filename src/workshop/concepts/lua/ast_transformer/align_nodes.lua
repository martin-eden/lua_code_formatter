-- Change AST nodes for easier downstream processing

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  Changed nodes:
    * For nodes with single string element that element goes to <.value>
    * <assign_or_call> - exact type resolved. Subnode may sink up.
    * <var_or_call> - exact type resolved
    * <local_statement> - exact type resolved. Subnode sinks up.
]]

local align_nodes
align_nodes =
  function(parent, index)
    local node = parent[index]

    if not is_table(node) then return end

    for subnode_index in ipairs(node) do
      align_nodes(node, subnode_index)
    end

    if (#node == 1) and is_string(node[1]) then
      node.value = node[1]
      node[1] = nil
    end

    if (node.type == 'assign_or_call') then
      if (node[1].type == 'function_call') then
        node = node[1]
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
      if (node[1].type == 'named_function') then
        node[1].type = 'local_named_function'
      else
        node[1].type = 'local_assignment'
      end
      node = node[1]
    end

    parent[index] = node
  end

-- Export:
return align_nodes

--[[
  2018 #
  2026-10-21
  2026-10-31
]]
