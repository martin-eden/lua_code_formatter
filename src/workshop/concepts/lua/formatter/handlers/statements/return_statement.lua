-- Serialize "return" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

local oneliner =
  function(me, node)
    me[1]:add_to_curline('return ')
    return me:process_node(node[1])
  end

local multiliner =
  function(me, node)
    return me:process_block_multiline('return', node[1])
  end

return
  function(me, node)
    if not node[1] then
      me[1]:add_to_curline('return')
      return true
    else
      return me:variate(node, oneliner, multiliner)
    end
  end

--[[
  2016 # #
  2017 #
  2018 #
  2026-10-23
]]
