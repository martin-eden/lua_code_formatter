local unquote = request('^.^.^.unquote_string')

return
  function(self, node)
    return
      {
        type = 'string',
        value = unquote(node.value),
      }
  end
