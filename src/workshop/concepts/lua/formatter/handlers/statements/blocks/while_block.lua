-- Serialize "while" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

return
  function(me, node)
    return
      me:process_block_oneline('while ', node.condition, ' do') and
      me:process_block_multiline(nil, node.body, 'end')
  end

--[[
  2016 #
  2017 #
  2026-10-31
]]
