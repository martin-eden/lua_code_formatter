return
  function(self, node)
    if is_table(node) and node.type then
      local node_type = node.type or '?nil'
      local handler = self.handlers[node_type]
      if is_function(handler) then
        return handler(self, node)
      else
        self.printer:add_curline('<' .. node_type .. '>')
        return
      end
    else
      print('!', 'type(node)', type(node))
      if is_table(node) then
        print('node.type', node.type)
        if node[1] then
          print('node[1].type', node[1].type)
        end
      end
      print('There is some uncovered cases in code formatter.')
    end
    return true
  end
