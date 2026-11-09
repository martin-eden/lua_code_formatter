-- Serialize block as oneliner with prefix and postfix

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

return
  function(me, prefix, node, postfix, opt_handler)
    local printer = me[1]
    if prefix then
      printer:add_to_curline(prefix)
    end
    local result = me:process_block(node, opt_handler)
    if postfix then
      printer:add_to_curline(postfix)
    end
    return result
  end

--[[
  2017 # #
]]
