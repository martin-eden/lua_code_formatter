return
  function(self, node)
    local result
    if is_table(node) then
      if node.type then
        node.value = self.stream:get_segment(node.start, node.len)
        local handler = self.handlers[node.type]
        if handler then
          result = handler(self, node)
        else
          print('Encountered unknown structure <' .. node.type .. '>.')
        end
      else
        result = node
      end
    end
    return result
  end
