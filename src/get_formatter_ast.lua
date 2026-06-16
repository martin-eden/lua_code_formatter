-- Parse Lua code and write processed syntax tree to file

--[[
  Author: Martin Eden
  Last mod.: 2026-06-16
]]

--[[ Develop
package.path = package.path .. ';../../../?.lua'
--]]
require('workshop.base')

-- Imports:
local get_params = request('get_formatter_ast.get_params')
local convert = request('!.file.convert')
local get_ast = request('!.lua.code.get_ast')
local transform_ast = request('!.formats.lua.transform_ast')

local parse =
  function(s)
    local result
    result = get_ast(s)
    result =
      transform_ast(
        result,
        {
          keep_comments = true,
          keep_unparsed_tail = true,
        }
      )
    return result
  end

local get_formatter_ast =
  function(args)
    local f_in_name, f_out_name = get_params(args)
    if not f_in_name then
      return
    end
    convert(
      {
        f_in_name = f_in_name,
        f_out_name = f_out_name,
        parse = parse,
      }
    )
  end

-- Main:
do
  get_formatter_ast(_G.arg)
end

--[[
  2017 # #
  2026-06-16
]]
