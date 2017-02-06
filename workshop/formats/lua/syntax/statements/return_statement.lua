local parser = request('!.mechs.parser')
local handy = parser.handy

local word = request('^.words.word')
local opt_spc = request('^.words.opt_spc')
local expr_list = request('^.expressions.expr_list')
local empty_statement = request('empty_statement')

return
  handy.interleave(
    {
      name = 'return_statement',
      word('return'),
      handy.opt(opt_spc, expr_list),
      handy.opt(opt_spc, empty_statement)
    },
    opt_spc
  )
