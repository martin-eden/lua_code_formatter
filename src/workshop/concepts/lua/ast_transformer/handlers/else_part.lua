-- Transform "else_part"

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  <statements>
]]

return
  function(node)
    node.body = node[1]
    node[1] = nil
  end

--[[
  2018 #
  2026-10-31
]]
