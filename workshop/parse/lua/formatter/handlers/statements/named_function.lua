return
  function(self, node)
    local result = {}
    result.type = 'named_function'

    local dotted_list = node[1]
    local colon_name
    local idx_params
    if node[2] and (node[2].name == 'colon_name') then
      colon_name = node[2]
      idx_params = 3
    else
      idx_params = 2
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
