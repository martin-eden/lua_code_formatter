-- Serialize assignment

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

return
  function(Me, Node)
    if not Me:ProcessNode(Node.dest_list) then
      return
    end
    if Node.val_list then
      Me[2]:AddToTextline(' = ')
      return Me:ProcessBlock(Node.val_list)
    end
    return true
  end

--[[
  2016 #
  2017 # #
]]
