return
  function(self, node)
    if (#node == 2) then
      node.key = node[1]
      node.value = node[2]
    else
      node.value = node[1]
    end
    node[1] = nil
    node[2] = nil
  end
