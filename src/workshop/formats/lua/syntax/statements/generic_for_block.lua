local word = request('^.words.word')
local name_list = request('^.wrappers.name_list')
local expr_list = request('^.wrappers.expr_list')

return
  {
    name = 'generic_for_block',
    word('for'),
    name_list,
    word('in'),
    expr_list,
    word('do'),
    '>statements',
    word('end'),
  }
