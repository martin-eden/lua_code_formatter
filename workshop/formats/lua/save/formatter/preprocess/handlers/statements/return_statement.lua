--[[
      "return"
  opt <expr_list>
  opt <empty_statement>
]]

return
  function(self, node)
    local result = {}
    if node[2] and (node[2].type == 'expr_list') then
      result.expr_list = self:process_node(node[2])
    end
    return result
  end
