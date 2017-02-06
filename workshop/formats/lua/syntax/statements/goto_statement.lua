local word = request('^.words.word')
local opt_spc = request('^.words.opt_spc')
local name = request('^.words.name')

return
  {
    name = 'goto_statement',
    word('goto'),
    opt_spc, name,
  }
