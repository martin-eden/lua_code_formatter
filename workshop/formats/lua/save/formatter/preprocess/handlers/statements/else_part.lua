--[[
  1 else
  2 <statements>
]]
return
  function(self, node)
    return
      {
        body = self:process_node(node[2]),
      }
  end
