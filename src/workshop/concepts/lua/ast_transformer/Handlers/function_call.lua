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
  function(Node)
    local Result
    local NamePart
    local seek_pos = 0

    while true do
      if (seek_pos < #Node) then
        NamePart = { Result }
        seek_pos = seek_pos + 1
      else
        break
      end

      NamePart.type = 'name_parts'
      while (Node[seek_pos].type ~= 'func_args') do
        add_to_list(NamePart, Node[seek_pos])
        seek_pos = seek_pos + 1
      end

      Result =
        {
          type = 'function_call',
          name_part = NamePart,
          args = Node[seek_pos],
        }
    end

    replace(Node, Result)
  end

--[[
  2018 #
  2026-10-31
]]
