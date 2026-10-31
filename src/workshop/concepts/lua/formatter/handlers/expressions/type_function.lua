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
    if not Me:process_node(Node.params) then
      return
    end

    Printer:RequestCleanLine()
    return Me:process_block_multiline(nil, Node.body, 'end')
  end

return
  function(Me, Node)
    return Me:variate(Node, nil, multiliner)
  end

--[[
  2016 #
  2017 # # #
]]
