-- Reformat Lua code

--[[
  Author: Martin Eden
  Last mod.: 2026-11-03
]]

--[[
  Contract

  Return function to reformat string with Lua code

    [f] -> [s] -- function that returns string with formatted code

      1 [s] -- string with Lua code
      ? [?] -- options
]]

local get_ast
do
  local TokensSyntax = request('!.concepts.lua.TokensSyntax')
  local generic_parse = request('!.mechs.generic_loader')
  local TokensAccessorClass = request('!.concepts.lua.TokensAccessor')
  local StructsSyntax = request('!.concepts.lua.syntax')
  local parse = request('!.mechs.parser.parse')

  get_ast =
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
end

local get_formatter_ast
do
  local transform_ast = request('!.concepts.lua.transform_ast')

  get_formatter_ast =
    function(lua_code_str)
      return transform_ast(get_ast(lua_code_str))
    end
end

local reformat_code
do
  local split_shebang = request('!.concepts.shell.split_shebang')
  local serialize_ast = request('!.concepts.lua.run_formatter')
  local newline = request('!.concepts.Ascii.Chars').newline

  reformat_code =
    function(shell_code_str, Options)
      local shebang_str, lua_code_str = split_shebang(shell_code_str)

      local result_str =
        serialize_ast(get_formatter_ast(lua_code_str), Options)

      if shebang_str then
        result_str = shebang_str .. newline .. result_str
      end

      return result_str
    end
end

-- Export:
return reformat_code

--[[
  2018 #
  2026 # # # # #
  2026-11-03
]]
