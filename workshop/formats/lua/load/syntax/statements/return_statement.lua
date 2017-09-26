local handy = request('!.mechs.processor.handy')

local word = request('^.words.word')
local expr_list = request('^.expressions.expr_list')
local empty_statement = request('empty_statement')

return
  {
    name = 'return_statement',
    word('return'),
    handy.opt(expr_list),
    handy.opt(empty_statement),
  }
