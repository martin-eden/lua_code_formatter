local word = request('^.words.word')
local name_list = request('^.words.name_list')
local expr_list = request('^.expressions.expr_list')
local statements = request('statements')

return
  {
    name = 'generic_for_block',
    word('for'),
    name_list,
    word('in'),
    expr_list,
    word('do'),
    statements,
    word('end'),
  }
