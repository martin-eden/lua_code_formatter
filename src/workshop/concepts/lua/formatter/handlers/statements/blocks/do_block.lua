-- Serialize "do-end" block

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

return
  function(Me, Node)
    Me[2]:RequestCleanLine()
    return Me:process_block_multiline('do', Node[1], 'end')
  end

--[[
  2016 #
  2017 # #
]]
