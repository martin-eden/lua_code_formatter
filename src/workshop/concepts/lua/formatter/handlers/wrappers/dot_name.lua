-- Serialize dotted name

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

return
  function(Me, Node)
    Me.printer:AddToCurline('.')
    return Me:process_node(Node[1])
  end

--[[
  2016 #
  2017 #
  2018 #
]]
