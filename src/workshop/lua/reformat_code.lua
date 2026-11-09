-- Reformat Lua code

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  Contract

  Return function to reformat string with Lua code

    [f] -> [s] -- function that returns string with formatted code

      1 [s] -- string with Lua code
      ? [?] -- options
]]

local get_formatter_ast
do
  local get_ast
  do
    local tokens_syntax = request('!.concepts.lua.tokens_syntax')
    local generic_parse = request('!.mechs.generic_loader')
    local tokens_accessor = request('!.concepts.lua.tokens_accessor')
    local syntax = request('!.concepts.lua.syntax')
    local parse = request('!.mechs.parser.parse')
    get_ast =
      function(code_str)
        local syntax_ast = { }
        do
          local tokens = generic_parse(code_str, tokens_syntax)
          local tokens_accessor = tokens_accessor.create(tokens)
          local is_parsed
          is_parsed, syntax_ast = parse(tokens_accessor, syntax)
        end
        return syntax_ast
      end
  end
  local transform_ast = request('!.concepts.lua.transform_ast')
  get_formatter_ast =
    function(lua_code_str)
      return transform_ast(get_ast(lua_code_str))
    end
end

local split_shebang = request('!.concepts.shell.split_shebang')
local serialize_ast = request('!.concepts.lua.run_formatter')
local newline = request('!.concepts.ascii.chars').newline

-- Export:
return
  function(shell_code_str, options)
    local shebang_str, lua_code_str = split_shebang(shell_code_str)

    local result_str =
      serialize_ast(get_formatter_ast(lua_code_str), options)

    if shebang_str then
      result_str = shebang_str .. newline .. result_str
    end

    return result_str
  end

--[[
  2018 #
  2026 # # # # #
  2026-11-03
]]
