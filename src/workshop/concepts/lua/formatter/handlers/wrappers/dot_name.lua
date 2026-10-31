-- Serialize dotted name

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

return
  function(Me, Node)
    Me[2]:AddToCurline('.')
    return Me:process_node(Node[1])
  end

--[[
  2016 #
  2017 #
  2018 #
]]
