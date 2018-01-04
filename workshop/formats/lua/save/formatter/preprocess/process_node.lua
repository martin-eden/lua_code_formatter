return
  function(self, node)
    if not is_table(node) then
      return -- todo: should investigate this case
    end

    local result

    if not node.type then
      error('Given node has no .type')
    end

    local handler = self.handlers[node.type]
    if handler then
      result = handler(self, node)
      if not result.type then
        result.type = node.type
      end
    else
      -- print(('No handler for type "%s". Using default behavior.'):format(node.type))
      result = {type = node.type, value = node[1]}
    end

    return result
  end
