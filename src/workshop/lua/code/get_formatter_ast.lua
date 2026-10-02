-- For string with Lua code return AST for formatter

--[[
  Author: Martin Eden
  Last mod.: 2026-10-24
]]

local get_ast = request('get_ast')
local get_formatter_ast = request('!.concepts.lua.transform_ast')

return
  function(lua_code_str)
    return get_formatter_ast(get_ast(lua_code_str))
  end

--[[
  2026-10-24
]]
