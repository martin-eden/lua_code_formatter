-- Serialize "while" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-11-16
]]

local oneliner =
  function(me, node)
    return me:process_block_oneline('while ', node, ' do')
  end

local multiliner =
  function(me, node)
    return me:process_block_multiline('while', node, 'do')
  end

return
  function(me, node)
    return
      me:variate(node.condition, oneliner, multiliner) and
      me:process_block_multiline(nil, node.body, 'end')
  end

--[[
  2016 #
  2017 #
  2026 #
  2026-11-16
]]
