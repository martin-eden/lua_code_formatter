-- node formatting

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

return
  function(me, node)
    --[[
      nils are okay

      (For example <local_named_funcion> may have .body = nil)
    ]]
    if not node then return true end

    local node_type = node.type

    if not node_type then
      --[[
        Passed some table without <.type>. It occurs for empty files
        or for files which we failed to parse.

        It's ok when given node is not sequence.
      ]]
      return true
    end

    local handler = me.handlers[node_type]
    if is_function(handler) then
      return handler(me, node)
    else
      local node_value = node.value
      me[1]:add_to_curline(node_value)
      return true
    end
  end

--[[
  2016 #
  2017 # #
  2018 # # #
  2026-10-22
  2026-10-31
]]
