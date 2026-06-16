--[[
  opt <name_list>
  opt <vararg>
]]

local replace = request('!.table.replace')

return
  function(self, node)
    local result

    if node[1] and (node[1].type == 'name_list') then
      result = node[1]
      result[#result + 1] = node[2]
    else
      result = {node[1]}
    end
    result.type = node.type

    replace(node, result)
  end
