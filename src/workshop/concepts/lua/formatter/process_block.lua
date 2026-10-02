-- Serialize node as block (in indent)

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

return
  function(Me, Node, handler)
    local result
    Me.printer:IncIndent()
    if handler then
      result = handler(Me, Node)
    else
      result = Me:process_node(Node)
    end
    Me.printer:DecIndent()
    return result
  end

--[[
  2017 #
]]
