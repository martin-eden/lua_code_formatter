-- Transform "elseif_part"

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

--[[
  <expression>
  <statements>
]]

return
  function(Node)
    Node.condition = Node[1]
    Node[1] = nil

    Node.body = Node[2]
    Node[2] = nil
  end

--[[
  2018 #
  2026-10-31
]]
