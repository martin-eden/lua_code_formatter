-- Serialize sequence of statements

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

--[[
  Each statement starts with new line, except <empty_statement> ";".
]]

local multiliner =
  function(Me, Node)
    local Printer = Me[2]

    for _, Subnode in ipairs(Node) do
      if (Subnode.type ~= 'empty_statement') then
        Printer:RequestCleanLine()
      end
      if not Me:process_node(Subnode) then
        return
      end
    end

    return true
  end

return
  function(Me, Node)
    return Me:variate(Node, nil, multiliner)
  end

--[[
  2016 #
  2017 # # # #
]]
