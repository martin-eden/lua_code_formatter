-- Apply transformation handlers to syntax tree

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

local Handlers

local restruc_nodes
restruc_nodes =
  function(Node)
    for _, Subnode in ipairs(Node) do
      restruc_nodes(Subnode)
    end

    local handler = Handlers[Node.type]
    if handler then
      handler(Node)
    end
  end

return
  function(Node, Arg_Handlers)
    Handlers = Arg_Handlers
    restruc_nodes(Node)
    Handlers = nil
  end

--[[
  2018 #
  2026-10-25
  2026-10-31
]]
