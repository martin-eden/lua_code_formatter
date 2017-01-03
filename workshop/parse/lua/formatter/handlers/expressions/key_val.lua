return
  function(self, node)
    local key, value
    if (#node == 2) then
      key, value = node[1], node[2]
    else
      value = node[1]
    end
    return
      {
        type = 'key_val',
        key = self:process_node(key),
        value = self:process_node(value),
      }
  end
