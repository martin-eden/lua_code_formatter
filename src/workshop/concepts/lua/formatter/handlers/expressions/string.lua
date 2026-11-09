-- Serialize string node

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

local str_sub = string.sub

return
  function(me, node)
    local printer = me[1]

    --[=[
      Quite ugly handling indexing [[[s]]] case: convert to [ [[s]]].
    ]=]
    if not printer:on_clean_line() then
      local text_line = printer[1]
      if
        (str_sub(text_line, -1) == '[') and
        (str_sub(node.value, 1, 1) == '[')
      then
        printer:add_to_curline(' ')
      end
    end

    printer:add_to_curline(node.value)

    return true
  end

--[[
  2016 #
  2017 # #
  2018 #
]]
