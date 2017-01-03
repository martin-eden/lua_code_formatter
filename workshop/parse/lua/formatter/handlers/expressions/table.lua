return
  function(self, node)
    local result
    result = self:process_list(node)
    result.type = 'table'
    return result
  end
