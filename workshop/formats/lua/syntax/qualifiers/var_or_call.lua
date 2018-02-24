local handy = request('!.mechs.processor.handy')
local cho = handy.cho
local opt = handy.opt
local rep = handy.rep
local opt_rep = handy.opt_rep

local name = request('^.words.name')
local syntel = request('^.words.syntel')

local par_expr = request('^.wrappers.par_expr')
local bracket_expr = request('^.wrappers.bracket_expr')
local expr_list = request('^.wrappers.expr_list')
local dot_name = request('^.wrappers.dot_name')
local colon_name = request('^.wrappers.colon_name')

local type_string = request('^.type_string')
local type_table = request('^.type_table')

local func_args =
  {
    name = 'func_args',
    cho(
      {syntel('('), opt(expr_list), syntel(')')},
      type_string,
      type_table
    ),
  }

return
  {
    name = 'var_or_call',
    cho(name, par_expr),
    opt_rep(
      cho(
        bracket_expr,
        dot_name,
        {opt(colon_name), func_args}
      )
    ),
  }
