-- Serialize Lua code AST to string with actual Lua code.

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

--[[
  It receives table with formatter's AST and returns string with
  formatted code.
]]

local formatter_class = request('formatter.interface')

return
  function(ast, options)
    local formatter = formatter_class.create(options)
    formatter:process_node(ast)
    return formatter[1]:get_text()
  end

--[[
  2018 #
  2026-10-24
  2026-10-31
]]
