-- Serialize Lua code AST to string with actual Lua code.

--[[
  Author: Martin Eden
  Last mod.: 2026-10-24
]]

--[[
  It receives table with formatter's AST and returns string with
  formatted code.
]]

local FormatterClass = request('formatter.interface')

return
  function(FormatterAst, Options)
    local Formatter = new(FormatterClass, Options)
    Formatter.data_struc = FormatterAst
    Formatter:init()
    return Formatter:run()
  end

--[[
  2018 #
  2026-10-24
]]
