--[[
       <name_list>
  opt( "="
     ) <expr_list>
]]

return
  function(self, node)
    return
      {
        name_list = self:process_node(node[1]),
        val_list = self:process_node(node[3]),
      }
  end
