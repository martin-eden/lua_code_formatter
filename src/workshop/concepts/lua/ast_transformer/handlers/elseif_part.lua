-- Transform "elseif_part"

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  <expression>
  <statements>
]]

return
  function(node)
    node.condition = node[1]
    node[1] = nil

    node.body = node[2]
    node[2] = nil
  end

--[[
  2018 #
  2026-10-31
]]
