local quote = request('^.^.^.^.quote_string')

return
  function(self, node)
    self.printer:add_text(quote(node.value))
  end
