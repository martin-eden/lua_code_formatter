-- Transform "key_val"

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

return
  function(node)
    if (#node == 2) then
      node.key = node[1]
      node.value = node[2]
      node[2] = nil
    else
      node.value = node[1]
    end
    node[1] = nil
  end

--[[
  2018 #
  2026-10-31
]]
