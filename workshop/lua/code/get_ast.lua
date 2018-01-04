--[[
  Get AST for string with Lua code.

  str -> table
]]

local parse = request('!.mechs.generic_loader')
local syntax = request('!.formats.lua.syntax')

return
  function(s)
    assert_string(s)
    return parse(s, syntax)
  end
