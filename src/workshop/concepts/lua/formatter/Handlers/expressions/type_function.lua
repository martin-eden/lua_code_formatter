-- Serialize function

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

local multiliner =
  function(Me, Node)
    local Printer = Me[2]

    Printer:RequestCleanLine()
    Printer:AddToCurline('function')
    if not Me:ProcessNode(Node.params) then
      return
    end

    Printer:RequestCleanLine()
    return Me:ProcessBlock_Multiline(nil, Node.body, 'end')
  end

return
  function(Me, Node)
    return Me:Variate(Node, nil, multiliner)
  end

--[[
  2016 #
  2017 # # #
]]
