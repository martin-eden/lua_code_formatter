return
  function(self, node)
    local key, value
    if (#node == 3) then
      key, value = node[1], node[3]
    else
      value = node[1]
    end

    return
      {
        key = self:process_node(key),
        value = self:process_node(value),
      }
  end
