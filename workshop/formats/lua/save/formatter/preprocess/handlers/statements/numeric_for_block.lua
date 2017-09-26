--[[
      "for"
      <name>
      "="
      <expression>
      ","
      <expression>
opt(  ","
   )  <expression>
      "do"
      <statements>
      "end"
]]

return
  function(self, node)
    local result =
      {
        index = self:process_node(node[2]),
        start_val = self:process_node(node[4]),
        end_val = self:process_node(node[6]),
      }
    local body_index
    if node[8] and (node[8].type == 'expression') then
      result.increment = self:process_node(node[8])
      body_index = 10
    else
      body_index = 8
    end
    local body = node[body_index]
    if body then
      result.body = self:process_node(body)
    end
    return result
  end
