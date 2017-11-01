--[[
  1 "if"
  2 <expression>
  3 "then"
  4 <statements>
]]

return
  function(self, node)
    return
      {
        condition = self:process_node(node[2]),
        body = self:process_node(node[4]),
      }
  end
