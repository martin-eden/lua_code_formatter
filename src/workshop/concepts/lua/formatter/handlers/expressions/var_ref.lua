-- Serialize variable reference

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

return
  function(me, node)
    return me:process_node(node.name_part)
  end

--[[
  2016 #
  2017 #
  2026-10-31
]]
