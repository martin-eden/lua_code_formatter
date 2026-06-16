--[[
      <dot_list>
      <function_params>
  opt <statements>
]]

return
  function(self, node)
    node.dotted_name = node[1]
    node[1] = nil

    node.params = node[2]
    node[2] = nil

    node.body = node[3]
    node[3] = nil
  end
