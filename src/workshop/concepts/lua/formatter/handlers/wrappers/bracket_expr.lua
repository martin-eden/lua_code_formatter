-- Serialize bracketed index

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

local oneliner =
  function(Me, Node)
    Me.printer:AddToCurline('[')
    if not Me:process_node(Node[1]) then
      return
    end
    Me.printer:AddToCurline(']')
    return true
  end

local multiliner =
  function(Me, Node)
    Me.printer:AddToCurline('[')

    Me.printer:RequestCleanLine()
    if not Me:process_block(Node[1]) then
      return
    end

    Me.printer:RequestCleanLine()
    Me.printer:AddToCurline(']')

    return true
  end

return
  function(Me, Node)
    return Me:variate(Node, oneliner, multiliner)
  end

--[[
  2016 #
  2017 # #
  2018 #
]]
