-- Serialize "local assignment"

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

return
  function(Me, Node)
    local Printer = Me[2]
    Printer:AddToCurline('local ')
    if not Me:process_block(Node.name_list) then
      return
    end
    if Node.val_list then
      Printer:AddToTextline(' = ')
      return Me:process_block(Node.val_list)
    end
    return true
  end

--[[
  2016 #
  2017 # #
]]
