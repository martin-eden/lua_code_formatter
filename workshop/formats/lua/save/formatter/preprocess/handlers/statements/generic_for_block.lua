--[[
  1 for
  2 <name_list>
  3 in
  4 <expr_list>
  5 do
  6 <statements>
  7 end
]]
return
  function(self, node)
    return
      {
        names = self:process_node(node[2]),
        expr_list = self:process_node(node[4]),
        body = self:process_node(node[6]),
      }
  end
