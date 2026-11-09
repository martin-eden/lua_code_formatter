-- Transform "function_call"

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

--[[
  function_call:

    name | par_expr
    (rep)
      (opt rep) bracket_expr | dot_name
      (opt) colon_name
      func_args

  Input structure is a list with possibly several <func_args>.
  We fold inner <func_args>, so returned structure at any level
  contains only one <func_args>.

  result:

    name | par_expr
    inner_part

    inner_part:

      (opt rep) bracket_expr | dot_name
      (opt) inner_part
      (opt) colon_name
      func_args
]]

local add_to_list = request('!.concepts.list.add_item')
local replace = request('!.table.replace')

return
  function(node)
    local result
    local name_part
    local seek_pos = 0

    while true do
      if (seek_pos < #node) then
        name_part = { result }
        seek_pos = seek_pos + 1
      else
        break
      end

      name_part.type = 'name_parts'
      while (node[seek_pos].type ~= 'func_args') do
        add_to_list(name_part, node[seek_pos])
        seek_pos = seek_pos + 1
      end

      result =
        {
          type = 'function_call',
          name_part = name_part,
          args = node[seek_pos],
        }
    end

    replace(node, result)
  end

--[[
  2018 #
  2026-10-31
]]
