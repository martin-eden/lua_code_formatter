-- Serialize assignment

--[[
  Author: Martin Eden
  Last mod.: 2026-11-24
]]

return
  function(me, node)
    if not me:process_node(node[1]) then
      return
    end
    me[1]:add_to_textline(' = ')
    return me:process_block(node[2])
  end

--[[
  2016 #
  2017 # #
]]
