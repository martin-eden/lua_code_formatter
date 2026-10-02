-- Serialize string node

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

local str_sub = string.sub

return
  function(Me, Node)
    --[=[
      Quite ugly handling indexing [[[s]]] case: convert to [ [[s]]].
    ]=]
    if not Me.printer:OnCleanLine() then
      local text_line = Me.printer[1]
      if
        (str_sub(text_line, -1) == '[') and
        (str_sub(Node.value, 1, 1) == '[')
      then
        Me.printer:AddToCurline(' ')
      end
    end

    Me.printer:AddToCurline(Node.value)
    return true
  end

--[[
  2016 #
  2017 # #
  2018 #
]]
