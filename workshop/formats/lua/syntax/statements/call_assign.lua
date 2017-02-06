local parser = request('!.mechs.parser')
local handy = parser.handy

local var_link = request('^.expressions.var_link')
local opt_spc = request('^.words.opt_spc')
local expr_list = request('^.expressions.expr_list')

return
  {
    name = 'call_assign',
    var_link,
    opt_spc,
    handy.opt(
      {
        handy.opt(
          {
            ',',
            handy.list({opt_spc, var_link}, {opt_spc, ','}),
            opt_spc
          }
        ),
        '=',
        opt_spc, expr_list
      }
    ),
  }
