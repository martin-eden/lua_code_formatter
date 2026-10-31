-- Attribute (like "<const>") serialization

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

return
  function(Me, Node)
    local Printer = Me[2]
    Printer:AddToCurline('<')
    Me:ProcessNode(Node[1])
    Printer:AddToCurline('>')
    return true
  end

--[[
  2026-10-28
]]
