-- Apply transformation handlers to syntax tree

--[[
  Author: Martin Eden
  Last mod.: 2026-10-25
]]

return
  function(Me, Node)
    for _, Subnode in ipairs(Node) do
      Me:restruc_nodes(Subnode)
    end

    local handler = Me.handlers[Node.type]
    if handler then
      handler(Me, Node)
    end
  end

--[[
  2018 #
  2026-10-25
]]
