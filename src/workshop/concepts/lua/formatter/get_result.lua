-- Return string with formatted Lua code from AST

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

return
  function(Me)
    return Me.printer:GetText()
  end

--[[
  2018
  2026-07-17
  2026-10-23
]]
