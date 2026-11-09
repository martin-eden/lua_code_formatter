-- Serialize block as multiline with prefix and postfix

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

    printer:request_clean_line()
    local result = me:process_block(node, opt_handler)

    printer:request_clean_line()
    if postfix then
      printer:add_to_curline(postfix)
    end

    return result
  end

--[[
  2017 # #
  2026-10-27
]]
