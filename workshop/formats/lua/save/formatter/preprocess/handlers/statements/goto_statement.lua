--[[
 1 goto
 2 <name>
]]

return
  function(self, node)
    return
      {
        label = self:process_node(node[2]),
      }
  end
