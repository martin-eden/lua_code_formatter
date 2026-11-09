-- Named vararg serialization

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

--[[
  Lua 5.5 added syntax to reference "..." under name:

    local f = function(a, b, ... args) end

  Name is optional.
]]

return
  function(me, node)
    if node[1] then
      me[1]:add_to_curline('... ')
      return me:process_node(node[1])
    end

    me[1]:add_to_curline(node.value)
    return true
  end

--[[
  2026-10-28
]]
