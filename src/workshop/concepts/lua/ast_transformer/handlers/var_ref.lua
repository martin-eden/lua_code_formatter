-- Transform "var_ref"

--[[
  Author: Martin Eden
  Last mod.: 2026-11-24
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

  In my opinion, this is the most complex code in preformatter facility.

  result:

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
  function(node)
    local result
    local name_parts
    local seek_pos = 0

    while true do
      if (seek_pos < #node) then
        name_parts = { result }
        seek_pos = seek_pos + 1
      else
        break
      end

      while
        (seek_pos <= #node) and
        (node[seek_pos].type ~= 'func_args')
      do
        add_to_list(name_parts, node[seek_pos])
        seek_pos = seek_pos + 1
      end
      name_parts.type = 'name_parts'

      local args = node[seek_pos]
      result = { name_parts, args }
      if args then
        result.type = 'function_call'
      else
        result.type = 'var_ref'
      end
    end

    replace(node, result)
  end

--[[
  2018 #
  2026-10-31
]]
