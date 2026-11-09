-- Serialize method name

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

return
  function(me, node)
    me[1]:add_to_curline(':')
    return me:process_node(node[1])
  end

--[[
  2016 #
  2017 #
  2018 #
]]
