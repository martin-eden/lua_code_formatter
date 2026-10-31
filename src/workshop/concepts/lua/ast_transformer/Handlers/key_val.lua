-- Transform "key_val"

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

return
  function(Node)
    if (#Node == 2) then
      Node.key = Node[1]
      Node.value = Node[2]
      Node[2] = nil
    else
      Node.value = Node[1]
    end
    Node[1] = nil
  end

--[[
  2018 #
  2026-10-31
]]
