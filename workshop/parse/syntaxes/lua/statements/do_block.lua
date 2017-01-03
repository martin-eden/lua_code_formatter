local word = request('^.words.word')
local opt_spc = request('^.words.opt_spc')
local statements = request('statements')

return
  {
    name = 'do_block',
    word('do'),
    opt_spc, statements,
    opt_spc, word('end'),
  }
