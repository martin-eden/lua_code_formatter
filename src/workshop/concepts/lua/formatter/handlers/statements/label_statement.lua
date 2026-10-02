-- Serialize "label" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

return
  function(Me, Node)
    local Printer = Me.printer

    Printer:AddToCurline('::')
    if not Me:process_node(Node[1]) then
      return
    end
    Printer:AddToCurline('::')

    return true
  end

--[[
  2016
  2017
  2018
]]
