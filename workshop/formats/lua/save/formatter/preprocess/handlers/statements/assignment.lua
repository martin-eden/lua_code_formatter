--[[
    1 <var_ref>
  | 2 ","
  | 3 <var_ref>
  | 4 ","
  | 5 <var_ref>
  | ...
  |n-1 "="
  | n <expr_list>
}

]]

return
  function(self, node)
    local result

    local dest_list = {type = 'ref_list'}
    for i = 1, (#node - 1) do
      if is_table(node[i]) then
        dest_list[#dest_list + 1] = self:process_node(node[i])
      end
    end

    result =
      {
        type = 'assignment',
        dest_list = dest_list,
        val_list = self:process_list(node[#node]),
      }

    return result
  end
