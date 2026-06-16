-- Parse Lua code and write syntax tree to file

--[[
  Author: Martin Eden
  Last mod.: 2026-10-20
]]

--[[ Develop
package.path = package.path .. ';../../../?.lua'
--]]
require('workshop.base')

local t2s
do
  local table_to_str = request('!.convert.table_to_str')
  local Settings =
    {
      style = 'readable_long',
      use_compact_indices = true,
      use_compact_sequences = true,
    }
  t2s =
    function(Table)
      return table_to_str(Table, Settings)
    end
end

local write_ast
do
  local get_params = request('get_ast.get_params')
  local get_ast = request('!.lua.code.get_ast')
  local convert = request('!.file_system.file.convert')
  write_ast =
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
          compile = t2s,
        }
      )
    end
end

-- Main:
write_ast(_G.arg)

--[[
  2017 # #
  2026 #
  2026-10-20
]]
