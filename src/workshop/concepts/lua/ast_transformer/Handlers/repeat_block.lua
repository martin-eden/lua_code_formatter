-- Transform "repeat_block"

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

--[[
  <statements>
  <expression>
]]

return
  function(Node)
    Node.body = Node[1]
    Node[1] = nil

    Node.condition = Node[2]
    Node[2] = nil
  end

--[[
  2018 #
  2026-10-31
]]
