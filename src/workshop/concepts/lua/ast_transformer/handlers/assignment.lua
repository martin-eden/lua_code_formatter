-- Transform "assignment" record

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  rep <var_ref>

      <expr_list>
]]

local add_to_list = request('!.concepts.list.add_item')
local replace = request('!.table.replace')

return
  function(node)
    local dest_list = { type = 'ref_list' }
    for i = 1, (#node - 1) do
      add_to_list(dest_list, node[i])
    end

    local result =
      {
        type = 'assignment',
        dest_list = dest_list,
        val_list = node[#node],
      }

    replace(node, result)
  end

--[[
  2018 #
  2026-10-31
]]
