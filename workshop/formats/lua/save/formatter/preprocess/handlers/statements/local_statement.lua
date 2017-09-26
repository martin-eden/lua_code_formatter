--[[
       "local"
  cho( <local_assignment>
     ) <named_function>
]]

return
  function(self, node)
    local result
    result = self:process_node(node[2]) or {}
    if (node[2].type == 'named_function') then
      result.type = 'local_named_function'
    elseif (node[2].type == 'local_assignment') then
      result.type = 'local_assignment'
    end
    return result
  end
