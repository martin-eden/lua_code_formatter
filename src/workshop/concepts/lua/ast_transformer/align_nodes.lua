-- Change AST nodes for easier downstream processing

--[[
  Author: Martin Eden
  Last mod.: 2026-10-21
]]

--[[
  Changed nodes:
    * For nodes with single string element that element goes to <.value>
    * <assign_or_call> - exact type resolved. Subnode may sink up.
    * <var_or_call> - exact type resolved
    * <local_statement> - exact type resolved. Subnode sinks up.
]]

return
  function(Me, Parent, index)
    local Node = Parent[index]

    if not is_table(Node) then return end

    for subnode_index in ipairs(Node) do
      Me:align_nodes(Node, subnode_index)
    end

    if (#Node == 1) and is_string(Node[1]) then
      Node.value = Node[1]
      Node[1] = nil
    end

    if (Node.type == 'assign_or_call') then
      if (Node[1].type == 'function_call') then
        Node = Node[1]
      else
        Node.type = 'assignment'
      end
    elseif (Node.type == 'var_or_call') then
      if (Node[#Node].type == 'func_args') then
        Node.type = 'function_call'
      else
        Node.type = 'var_ref'
      end
    elseif (Node.type == 'local_statement') then
      if (Node[1].type == 'named_function') then
        Node[1].type = 'local_named_function'
      else
        Node[1].type = 'local_assignment'
      end
      Node = Node[1]
    end

    Parent[index] = Node
  end

--[[
  2018 #
  2026-10-21
]]
