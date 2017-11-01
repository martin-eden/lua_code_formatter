--[[
  cho(
        "("
        opt <expr_list>
        ")"

        <type_table>
     )  <type_string>
]]

return
  function(self, node)
    local result

    if node[2] and (node[2].type == 'expr_list') then
      -- It's ok. No need to modify <result> now. (f(a, b))
      result = self:process_node(node[2])
    elseif
      node[1] and
      ((node[1].type == 'string') or (node[1].type == 'table'))
    then
      -- Arg is a directly mentioned table or string (f 'abc')
      result = self:process_node(node[1])
      result = {result}
    else
      -- Empty args (f())
      result = {}
    end

    result.type = node.type

    return result
  end
