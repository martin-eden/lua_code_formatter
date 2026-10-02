-- Attributed name serialization

--[[
  Author: Martin Eden
  Last mod.: 2026-10-28
]]

return
  function(Me, Node)
    local Printer = Me.printer
    Me:process_node(Node[1])
    if Node[2] then
      Printer:AddToCurline(' ')
      Me:process_node(Node[2])
    end
    return true
  end

--[[
  2026-10-28
]]
