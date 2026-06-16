local word = request('^.words.word')

return
  {
    name = 'break_statement',
    word('break'),
  }
