local syntel = request('^.words.syntel')

return
  {
    name = 'empty_statement',
    syntel(';'),
  }
