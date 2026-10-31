-- Serialize "while" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

return
  function(Me, Node)
    return
      Me:ProcessBlock_Oneline('while ', Node.condition, ' do') and
      Me:ProcessBlock_Multiline(nil, Node.body, 'end')
  end

--[[
  2016 #
  2017 #
  2026-10-31
]]
