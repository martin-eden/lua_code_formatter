--[[
  "while"
  <expression>
  "do"
  <statements>
  "end"
]]

return
  function(self, node)
    return
      {
        condition = self:process_node(node[2]),
        body = self:process_node(node[4]),
      }
  end
