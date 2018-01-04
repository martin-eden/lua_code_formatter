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

local t2s = request('!.table.as_string')

return
  function(self, node)
    local result
    local name_part
    local seek_pos = 0

    while true do
      if (seek_pos < #node) then
        name_part = {result}
        seek_pos = seek_pos + 1
      else
        break
      end

      while
        (seek_pos <= #node) and
        (node[seek_pos].type ~= 'func_args')
      do
        name_part[#name_part + 1] = self:process_node(node[seek_pos])
        seek_pos = seek_pos + 1
      end
      name_part.type = 'name_parts'

      local args
      if node[seek_pos] then
        args = self:process_node(node[seek_pos])
      end
      result =
        {
          name_part = name_part,
          args = args,
        }
      if args then
        result.type = 'function_call'
      else
        result.type = 'var_ref'
      end
    end

    -- print('node\n', t2s(node))
    -- print('result\n', t2s(result))

    return result
  end
