-- Reformat string with Lua code

--[[
  Author: Martin Eden
  Last mod.: 2026-10-28
]]

local split_shebang = request('!.concepts.shell.split_shebang')
local get_formatter_ast = request('get_formatter_ast')
local serialize_ast = request('!.concepts.lua.run_formatter')
local newline = request('!.concepts.Ascii.Chars').newline

return
  function(shell_code_str, Options)
    local shebang_str, lua_code_str = split_shebang(shell_code_str)

    local result_str =
      serialize_ast(
        get_formatter_ast(lua_code_str),
        Options
      )

    if shebang_str then
      result_str = shebang_str .. newline .. result_str
    end

    return result_str
  end

--[[
  2018 #
  2026 # # #
  2026-10-24
  2026-10-28
]]
