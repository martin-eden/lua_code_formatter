-- Transform "repeat_block"

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  <statements>
  <expression>
]]

return
  function(node)
    node.body = node[1]
    node[1] = nil

    node.condition = node[2]
    node[2] = nil
  end

--[[
  2018 #
  2026-10-31
]]
