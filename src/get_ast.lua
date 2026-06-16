-- Parse Lua code and write syntax tree to file

--[[
  Author: Martin Eden
  Last mod.: 2026-06-16
]]

--[[ Develop
package.path = package.path .. ';../../../?.lua'
--]]
require('workshop.base')

-- Imports:
local get_params = request('get_ast.get_params')
local convert = request('!.file.convert')
local get_ast = request('!.lua.code.get_ast')

local get_ast =
  function(args)
    local f_in_name, f_out_name = get_params(args)
    if not f_in_name then
      return
    end
    convert(
      {
        f_in_name = f_in_name,
        f_out_name = f_out_name,
        parse = get_ast,
      }
    )
  end

-- Main:
do
  get_ast(_G.arg)
end

--[[
  2017 # #
  2026-06-16
]]
