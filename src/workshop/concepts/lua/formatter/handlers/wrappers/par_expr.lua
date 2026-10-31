-- Serialize parenthesized expression

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

local oneliner =
  function(Me, Node)
    local Printer = Me[2]
    Printer:AddToCurline('(')
    if not Me:process_node(Node[1]) then
      return
    end
    Printer:AddToCurline(')')
    return true
  end

local multiliner =
  function(Me, Node)
    local Printer = Me[2]

    Printer:AddToCurline('(')

    Printer:RequestCleanLine()
    if not Me:process_block(Node[1]) then
      return
    end

    Printer:RequestCleanLine()
    Printer:AddToCurline(')')

    return true
  end

return
  function(Me, Node)
    return Me:variate(Node, oneliner, multiliner)
  end

--[[
  2016 #
  2017 # # #
]]
