--[[
  <statements>
]]
return
  function(self, node)
    node.body = node[1]
    node[1] = nil
  end
