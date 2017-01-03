local quote = request('^.^.^.^.quote_string')

return
  function(self, node)
    self.printer:emit(quote(node.value))
  end
