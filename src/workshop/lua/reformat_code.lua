-- Reformat Lua code

--[[
  Author: Martin Eden
  Last mod.: 2026-11-19
]]

--[[
  Contract

  Return function to reformat string with Lua code

    [..] -> [s] -- function that returns string with formatted code

      1 [s] -- string with Lua code
      ? [?] -- options
]]

local get_ast
do
  local tokens_syntax = request('!.concepts.lua.tokens_syntax')
  local string_input_stream =
    request('!.concepts.streams.seekable.input.string')
  local parse = request('!.mechs.parser.parse')
  local tokens_accessor = request('!.concepts.lua.tokens_accessor')
  local syntax = request('!.concepts.lua.syntax')
  local transform_ast = request('!.concepts.lua.transform_ast')
  get_ast =
    function(code_str)
      local input_str = string_input_stream.create(code_str)
      local is_ok, tokens = parse(input_str, tokens_syntax)
      local input_tokens = tokens_accessor.create(tokens)
      local is_ok, syntax_ast = parse(input_tokens, syntax)
      return transform_ast(syntax_ast)
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
      serialize_ast(get_ast(lua_code_str), options)

    if shebang_str then
      result_str = shebang_str .. newline .. result_str
    end

    return result_str
  end

--[[
  2018 #
  2026 # # # # # #
]]
