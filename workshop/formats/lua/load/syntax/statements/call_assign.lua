local handy = request('!.mechs.processor.handy')

local var_link = request('^.expressions.var_link')
local opt_spc = request('^.words.opt_spc')
local expr_list = request('^.expressions.expr_list')

return
  {
    name = 'call_assign',
    handy.list(var_link, {opt_spc, ','}),
    handy.opt(
      opt_spc, '=',
      expr_list
    ),
  }
