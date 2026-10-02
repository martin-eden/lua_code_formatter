-- Serialize "repeat" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-10-27
]]

local oneline_condition =
  function(Me, Node)
    return Me:process_block_oneline(' ', Node)
  end

local multiline_condition =
  function(Me, Node)
    return Me:process_block_multiline(nil, Node)
  end

return
  function(Me, Node)
    if not Me:process_block_multiline('repeat', Node.body, 'until') then
      return
    end

    if not Me:variate(Node.condition, oneline_condition, multiline_condition) then
      return
    end

    return true
  end

--[[
  2016 #
  2017 # #
  2026-10-27
]]
