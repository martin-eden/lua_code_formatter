-- Parse Lua code and write processed syntax tree to file

--[[
  Author: Martin Eden
  Last mod.: 2026-10-21
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

local write_formatter_ast
do
  local parse
  do
    local get_ast = request('!.lua.code.get_ast')
    local transform_ast = request('!.concepts.lua.transform_ast')
    parse =
      function(s)
        return
          transform_ast(
            get_ast(s),
            {
              keep_unparsed_tail = true,
            }
          )
      end
  end

  local get_params = request('get_formatter_ast.get_params')
  local convert = request('!.file_system.file.convert')
  local table_to_str = request('!.convert.table_to_str')
  write_formatter_ast =
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
          compile = t2s,
        }
      )
    end
end

-- Main:
write_formatter_ast(_G.arg)

--[[
  2017 # #
  2026 #
  2026-10-20
]]
