-- Serialize assignment

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

return
  function(Me, Node)
    if not Me:process_node(Node.dest_list) then
      return
    end
    if Node.val_list then
      Me.printer:AddToTextline(' = ')
      return Me:process_block(Node.val_list)
    end
    return true
  end

--[[
  2016 #
  2017 # #
]]
