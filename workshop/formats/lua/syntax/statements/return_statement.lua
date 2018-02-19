local handy = request('!.mechs.processor.handy')
local opt = handy.opt

local word = request('^.words.word')
local expr_list = request('^.wrappers.expr_list')
local empty_statement = request('empty_statement')

return
  {
    name = 'return_statement',
    word('return'),
    opt(expr_list),
    opt(empty_statement),
  }
