-- Node formatting

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

return
  function(Me, Node)
    --[[
      nils are okay

      (For example <local_named_funcion> may have .body = nil)
    ]]
    if not Node then return true end

    assert_table(Node)

    local node_type = Node.type

    if not node_type then
      --[[
        Passed some table without <.type>. It occurs for empty files
        or for files which we failed to parse.

        It's ok when given node is not sequence.
      ]]
      assert(not Node[1])
      return true
    end

    local handler = Me.handlers[node_type]
    if is_function(handler) then
      return handler(Me, Node)
    else
      local node_value = Node.value
      Me.printer:AddToCurline(node_value)
      return true
    end
  end

--[[
  2016 #
  2017 # #
  2018 # # #
  2026-10-22
]]
