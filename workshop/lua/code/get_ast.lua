--[[
  Get AST for string with Lua code.
]]

local parse = request('!.mechs.generic_loader')
local syntax = request('!.formats.lua.load.syntax')

return
  function(s)
    assert_string(s)
    return parse(s, syntax)
  end
