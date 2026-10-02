-- Parse string with Lua code to AST table

--[[
  Author: Martin Eden
  Last mod.: 2026-10-28
]]

local TokensSyntax = request('!.concepts.lua.TokensSyntax')
local generic_parse = request('!.mechs.generic_loader')
local TokensAccessorClass = request('!.concepts.lua.TokensAccessor')
local StructsSyntax = request('!.concepts.lua.syntax')
local parse = request('!.mechs.parser.parse')

return
  function(code_str)
    local ParserAst = { }
    do
      local TokensList = generic_parse(code_str, TokensSyntax)
      local TokensAccessor = TokensAccessorClass.create(TokensList)
      local is_parsed
      is_parsed, ParserAst = parse(TokensAccessor, StructsSyntax)
    end
    return ParserAst
  end

--[[
  2018 #
  2026 # # # #
  2026-10-28
]]
