--[[
  1 "::"
  2 <name>
  3 "::"
]]

return
  function(self, node)
    return
      {
        label = self:process_node(node[2]),
      }
  end
