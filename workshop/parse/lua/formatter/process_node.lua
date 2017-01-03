return
  function(self, node)
    local result
    if is_table(node) then
      if node.name then
        local handler = self.handlers[node.name]
        if handler then
          result = handler(self, node)
          if result then
            result.type = result.type or node.name
          end
        else
          print('Encountered unknown structure <' .. node.name .. '>.')
        end
      else
        result = node
      end
    end
    return result
  end
