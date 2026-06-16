return
  function(self, node)
    if is_table(node) and node.type then
      local node_type = node.type or '?nil'
      local handler = self.handlers[node_type]
      if is_function(handler) then
        return handler(self, node)
      else
        if is_string(node.value) then
          self.printer:add_curline(node.value)
          return true
        else
          local msg =
            ('<no handler for non-trivial "%s" type>'):
            format(node_type)
          self.printer:add_curline(msg)
          return
        end
      end
    else
      if is_nil(node) then
        --[[
          Passed nil. It's ok.

          (For example <local_named_funcion> may have .body = nil)
        ]]
      elseif is_table(node) then
        --[[
          Passed some table without <.type>. It occurs for empty files
          or for files which we failed to parse.

          It's ok when given node is not sequence.
        ]]
        assert(not node[1])
      else
        print('!', 'type(node)', type(node))
        print('There are some uncovered cases in code formatter.')
      end
      return true
    end
  end
