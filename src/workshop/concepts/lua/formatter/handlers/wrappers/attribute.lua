-- Attribute (like "<const>") serialization

--[[
  Author: Martin Eden
  Last mod.: 2026-10-28
]]

return
  function(Me, Node)
    local Printer = Me.printer
    Printer:AddToCurline('<')
    Me:process_node(Node[1])
    Printer:AddToCurline('>')
    return true
  end

--[[
  2026-10-28
]]
