-- Serialize function call

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

return
  function(me, node)
    return
      me:process_node(node.name_part) and
      me:process_node(node.args)
  end

--[[
  2016 #
  2017 #
  2026-10-31
]]
