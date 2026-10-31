-- Serialize string node

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

local str_sub = string.sub

return
  function(Me, Node)
    local Printer = Me[2]

    --[=[
      Quite ugly handling indexing [[[s]]] case: convert to [ [[s]]].
    ]=]
    if not Printer:OnCleanLine() then
      local text_line = Printer[1]
      if
        (str_sub(text_line, -1) == '[') and
        (str_sub(Node.value, 1, 1) == '[')
      then
        Printer:AddToCurline(' ')
      end
    end

    Printer:AddToCurline(Node.value)

    return true
  end

--[[
  2016 #
  2017 # #
  2018 #
]]
