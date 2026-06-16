--[[
  <expression>
  <statements>
]]

return
  function(self, node)
    node.condition = node[1]
    node[1] = nil

    node.body = node[2]
    node[2] = nil
  end
