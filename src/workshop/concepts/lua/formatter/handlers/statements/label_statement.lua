-- Serialize "label" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

return
  function(me, node)
    me[1]:add_to_curline('::')
    if not me:process_node(node[1]) then
      return
    end
    me[1]:add_to_curline('::')

    return true
  end

--[[
  2016
  2017
  2018
]]
