-- Attributed name serialization

--[[
  Author: Martin Eden
  Last mod.: 2026-11-11
]]

return
  function(me, node)
    me:process_node(node[1])
    if node[2] then
      me[2]:add_to_curline(' ')
      me:process_node(node[2])
    end
    return true
  end

--[[
  2026-10-28
]]
