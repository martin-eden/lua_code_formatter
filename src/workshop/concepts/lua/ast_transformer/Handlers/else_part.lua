-- Transform "else_part"

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

--[[
  <statements>
]]

return
  function(Node)
    Node.body = Node[1]
    Node[1] = nil
  end

--[[
  2018 #
  2026-10-31
]]
