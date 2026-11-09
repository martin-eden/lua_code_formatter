-- Attribute (like "<const>") serialization

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

return
  function(me, node)
    me[1]:add_to_curline('<')
    me:process_node(node[1])
    me[1]:add_to_curline('>')
    return true
  end

--[[
  2026-10-28
]]
