--[[
  <statements>
  <expression>
]]

return
  function(self, node)
    node.body = node[1]
    node[1] = nil

    node.condition = node[2]
    node[2] = nil
  end
