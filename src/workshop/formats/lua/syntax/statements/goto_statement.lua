local word = request('^.words.word')
local name = request('^.words.name')

return
  {
    name = 'goto_statement',
    word('goto'),
    name,
  }
