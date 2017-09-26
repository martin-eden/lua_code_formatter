--[[
        "function"
        <dot_list>
  opt   <colon_name>
        <function_params>
        <statements>
        "end"
]]

return
  function(self, node)
    local result = {}

    local dotted_list = node[2]
    local colon_name
    local idx_params
    if node[3] and (node[3].type == 'colon_name') then
      colon_name = node[3]
      idx_params = 4
    else
      idx_params = 3
    end

    local params = self:process_node(node[idx_params])

    result.dotted_name = self:process_list(dotted_list)
    if colon_name then
      result.colon_name = self:process_node(colon_name)
    end

    local body = node[idx_params + 1]
    if body then
      body = self:process_node(body)
    end

    result.params = params
    result.body = body

    return result
  end
