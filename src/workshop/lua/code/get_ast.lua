-- Parse string with Lua code to AST table

--[[
  Author: Martin Eden
  Last mod.: 2026-10-24
]]

local Syntax = request('!.concepts.lua.syntax')
local parse = request('!.mechs.generic_loader')

return
  function(code_str)
    return ( parse(code_str, Syntax) )
  end

--[[
  2018 #
  2026 # # #
  2026-10-24
]]
