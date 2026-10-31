-- Named vararg serialization

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

--[[
  Lua 5.5 added syntax to reference "..." under name:

    local f = function(a, b, ... args) end

  Name is optional.
]]

return
  function(Me, Node)
    local Printer = Me[2]

    if Node[1] then
      Printer:AddToCurline('... ')
      return Me:process_node(Node[1])
    end

    Printer:AddToCurline(Node.value)
    return true
  end

--[[
  2026-10-28
]]
