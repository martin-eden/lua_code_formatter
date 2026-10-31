-- Serialize "local" assignment

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

return
  function(Me, Node)
    local Printer = Me[2]
    Printer:AddToCurline('local ')
    if not Me:ProcessBlock(Node.name_list) then
      return
    end
    if Node.val_list then
      Printer:AddToTextline(' = ')
      return Me:ProcessBlock(Node.val_list)
    end
    return true
  end

--[[
  2016 #
  2017 # #
]]
