return
  function(self, node)
    local result = self:process_list(node)
    local vararg = result[2]
    result = result[1] or {}
    result[#result + 1] = vararg
    result.type = 'function_params'
    return result
  end
