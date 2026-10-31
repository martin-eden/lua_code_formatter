-- Serialize "repeat" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-10-27
]]

local oneline_condition =
  function(Me, Node)
    return Me:ProcessBlock_Oneline(' ', Node)
  end

local multiline_condition =
  function(Me, Node)
    return Me:ProcessBlock_Multiline(nil, Node)
  end

return
  function(Me, Node)
    if not Me:ProcessBlock_Multiline('repeat', Node.body, 'until') then
      return
    end

    if not Me:Variate(Node.condition, oneline_condition, multiline_condition) then
      return
    end

    return true
  end

--[[
  2016 #
  2017 # #
  2026-10-27
]]
