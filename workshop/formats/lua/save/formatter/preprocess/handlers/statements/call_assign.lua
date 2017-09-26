--[[
    1 <var_link>
  | 2 ","
  | 3 <var_link>
  | 4 ","
  | 5 <var_link>
  | ...
  |n-1 "="
  | n <expr_list>
}

]]

return
  function(self, node)
    local result = {}
    local is_function_call = (#node == 1)
    if is_function_call then
      result = self:process_node(node[1])
    else
      result.type = 'assignment'
      local dest_list = {type = 'ref_list'}
      for i = 1, (#node - 1) do
        if is_table(node[i]) then
          dest_list[#dest_list + 1] = self:process_node(node[i])
        end
      end
      result.dest_list = dest_list
      result.val_list = self:process_list(node[#node])
    end
    return result
  end
