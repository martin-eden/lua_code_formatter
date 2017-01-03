return
  function(self, node)
    local result = {}
    local is_function_call = (#node == 1)
    if is_function_call then
      result = self:process_node(node[1])
    else
      result.dest_list = {}
      for i = 1, (#node - 1) do
        result.dest_list[i] = self:process_node(node[i])
      end
      result.dest_list.type = 'ref_list'
      result.val_list = self:process_list(node[#node])
      result.type = 'assignment'
    end
    return result
  end
