--[[
  1 do
  2 <statements>
  3 end
]]

return
  function(self, node)
    return
      {
        body = self:process_node(node[2]),
      }
  end
