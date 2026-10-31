-- Serialize "label" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

return
  function(Me, Node)
    local Printer = Me[2]

    Printer:AddToCurline('::')
    if not Me:ProcessNode(Node[1]) then
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
