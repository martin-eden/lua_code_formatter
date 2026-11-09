-- Serialize "repeat" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-11-11
]]

local oneliner =
  function(me, node)
    return me:process_block_oneline(' ', node)
  end

local multiliner =
  function(me, node)
    return me:process_block_multiline(nil, node)
  end

return
  function(me, node)
    if not me:process_block_multiline('repeat', node.body, 'until') then
      return
    end

    if not me:variate(node.condition, oneliner, multiliner) then
      return
    end

    return true
  end

--[[
  2016 #
  2017 # #
  2026-10-27
]]
