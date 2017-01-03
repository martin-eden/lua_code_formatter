local opt_spc = request('^.words.opt_spc')
local word = request('^.words.word')
local name_list = request('^.words.name_list')
local expr_list = request('^.expressions.expr_list')
local statements = request('statements')

return
  {
    name = 'generic_for_block',
    word('for'),
    opt_spc, name_list,
    opt_spc, word('in'),
    opt_spc, expr_list,
    opt_spc, word('do'),
    opt_spc, statements,
    opt_spc, word('end'),
  }
