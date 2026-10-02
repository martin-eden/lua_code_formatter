-- Serialize "return" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

local oneliner =
  function(Me, Node)
    Me.printer:AddToCurline('return ')
    return Me:process_node(Node[1])
  end

local multiliner =
  function(Me, Node)
    return Me:process_block_multiline('return', Node[1])
  end

return
  function(Me, Node)
    if not Node[1] then
      Me.printer:AddToCurline('return')
      return true
    else
      return Me:variate(Node, oneliner, multiliner)
    end
  end

--[[
  2016 # #
  2017 #
  2018 #
  2026-10-23
]]
