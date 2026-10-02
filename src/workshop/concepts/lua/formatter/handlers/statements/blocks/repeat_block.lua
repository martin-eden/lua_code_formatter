-- Serialize "repeat" statement

--[[
  Author: Martin Eden
  Last mod.: 2026-10-24
]]

return
  function(Me, Node)
    if not Me:process_block_multiline('repeat', Node.body, 'until') then
      return
    end
    Me.printer:AddToCurline(' ')
    return Me:process_node(Node.condition)
  end

--[[
  2016 #
  2017 # #
]]
