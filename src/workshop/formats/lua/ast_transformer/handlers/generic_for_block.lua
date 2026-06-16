--[[
  <name_list>
  <expr_list>
  <statements>
]]

return
  function(self, node)
    node.names = node[1]
    node[1] = nil

    node.expr_list = node[2]
    node[2] = nil

    node.body = node[3]
    node[3] = nil
  end
