-- Serialize Lua code AST to string with actual Lua code.

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

--[[
  It receives table with formatter's AST and returns string with
  formatted code.
]]

local FormatterClass = request('formatter.interface')

return
  function(Ast, Options)
    local Formatter = FormatterClass.create(Options)
    Formatter:process_node(Ast)
    return Formatter[2]:GetText()
  end

--[[
  2018 #
  2026-10-24
  2026-10-31
]]
