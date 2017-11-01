--[[
  "repeat"
  <statements>
  "until"
  <expression>
]]

return
  function(self, node)
    local result = {}
    local condition_index
    if (node[2].type == 'statements') then
      result.body = self:process_node(node[2])
      condition_index = 4
    else
      condition_index = 3
    end
    result.condition = self:process_node(node[condition_index])
    return result
  end
