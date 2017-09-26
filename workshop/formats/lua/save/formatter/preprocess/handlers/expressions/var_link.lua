--[[
  cho
    <name>
    <par_expr>
  opt_rep
    cho
      <dot_name>
      <bracket_expr>
      {<colon_name>, <func_args>}
      <func_args>
]]

return
  function(self, node)
    local result
    local name_part
    local name_part_pos = 0

    while true do
      if (name_part_pos < #node) then
        name_part = {result}
        name_part_pos = name_part_pos + 1
      else
        break
      end

      while
        (name_part_pos <= #node) and
        (node[name_part_pos].type ~= 'func_args')
      do
        name_part[#name_part + 1] = self:process_node(node[name_part_pos])
        name_part_pos = name_part_pos + 1
      end
      name_part.type = 'name_parts'

      local args
      if node[name_part_pos] then
        args = self:process_node(node[name_part_pos])
      end
      result =
        {
          name_part = name_part,
          args = args,
        }
      if args then
        result.type = 'function_call'
      else
        result.type = 'var_link'
      end
    end

    return result
  end
