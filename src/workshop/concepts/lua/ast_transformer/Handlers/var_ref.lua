-- Transform "var_ref"

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

--[[
  var_ref:

    name | par_expr
    (opt rep)
      (opt rep)
        (opt) colon_name
        func_args
      bracket_expr | dot_name

  Input structure is quite similar to [function_call] but must not
  end in <func_args>. We wrap subparts with <func_args> as <function_call>
  and fold them.

  In my opinion, this is the most complex code in preprocessor facility.

  Result:

    name | par_expr
    (opt) inner_part
    bracket_expr | dot_name

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

      while
        (seek_pos <= #Node) and
        (Node[seek_pos].type ~= 'func_args')
      do
        add_to_list(NamePart, Node[seek_pos])
        seek_pos = seek_pos + 1
      end
      NamePart.type = 'name_parts'

      local Args
      if Node[seek_pos] then
        Args = Node[seek_pos]
      end
      Result =
        {
          name_part = NamePart,
          args = Args,
        }
      if Args then
        Result.type = 'function_call'
      else
        Result.type = 'var_ref'
      end
    end

    replace(Node, Result)
  end

--[[
  2018 #
  2026-10-31
]]
