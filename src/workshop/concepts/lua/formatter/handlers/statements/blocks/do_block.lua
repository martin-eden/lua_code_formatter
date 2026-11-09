-- Serialize "do-end" block

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

return
  function(me, node)
    me[1]:request_clean_line()
    return me:process_block_multiline('do', node[1], 'end')
  end

--[[
  2016 #
  2017 # #
]]
