-- Serialize node as block (in indent)

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

return
  function(Me, Node, handler)
    local Printer = Me[2]
    local result
    Printer:IncIndent()
    if handler then
      result = handler(Me, Node)
    else
      result = Me:ProcessNode(Node)
    end
    Printer:DecIndent()
    return result
  end

--[[
  2017 #
]]
