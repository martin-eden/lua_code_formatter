-- Serialize "repeat" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-11-24
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
    local body = node[1]
    local condition = node[2]

    if not me:process_block_multiline('repeat', body, 'until') then
      return
    end

    if not me:variate(condition, oneliner, multiliner) then
      return
    end

    return true
  end

--[[
  2016 #
  2017 # #
  2026-10-27
]]
