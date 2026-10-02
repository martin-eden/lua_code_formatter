--[[
  rep <var_ref>

      <expr_list>
]]

local replace = request('!.table.replace')

return
  function(self, node)
    local dest_list = {type = 'ref_list'}
    for i = 1, (#node - 1) do
      dest_list[#dest_list + 1] = node[i]
    end

    local result =
      {
        type = 'assignment',
        dest_list = dest_list,
        val_list = node[#node],
      }

    replace(node, result)
  end
