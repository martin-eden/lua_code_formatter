-- Serialize node as block (in indent)

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

return
  function(me, node, handler)
    local result
    me[1]:inc_indent()
    if handler then
      result = handler(me, node)
    else
      result = me:process_node(node)
    end
    me[1]:dec_indent()
    return result
  end

--[[
  2017 #
]]
