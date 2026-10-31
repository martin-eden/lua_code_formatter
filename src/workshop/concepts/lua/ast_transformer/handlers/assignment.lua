-- Transform "assignment" record

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

--[[
  rep <var_ref>

      <expr_list>
]]

local add_to_list = request('!.concepts.list.add_item')
local replace = request('!.table.replace')

return
  function(Me, Node)
    local DestList = { type = 'ref_list' }
    for i = 1, (#Node - 1) do
      add_to_list(DestList, Node[i])
    end

    local Result =
      {
        type = 'assignment',
        dest_list = DestList,
        val_list = Node[#Node],
      }

    replace(Node, Result)
  end

--[[
  2018 #
  2026-10-31
]]
