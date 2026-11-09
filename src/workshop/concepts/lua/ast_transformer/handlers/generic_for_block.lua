-- Transform "generic_for_block"

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  <name_list>
  <expr_list>
  <statements>
]]

return
  function(node)
    node.names = node[1]
    node[1] = nil

    node.expr_list = node[2]
    node[2] = nil

    node.body = node[3]
    node[3] = nil
  end

--[[
  2018 #
  2026-10-31
]]
