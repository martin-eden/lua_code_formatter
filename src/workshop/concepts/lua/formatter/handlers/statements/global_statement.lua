-- Global statement handler

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

return
  function(Me, Node)
    local Printer = Me[2]
    Printer:AddToCurline('global ')
    if not Me:process_block(Node[1]) then return end
    if Node[2] then
      Printer:AddToCurline(' = ')
      if not Me:process_block(Node[2]) then return end
    end
    return true
  end

--[[
  2026-10-28
]]
