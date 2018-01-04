--[[
  Function call grammar.

  Same structure as [var_ref] but must end in <call_args>.

  Sample:

    (a).b[c]:d()().e(f)(g){}""
            ~~~~~~  ~~~~~~~~~~ call_args
       ~~~~~      ~~           name_continuation
    ~~~                        name | par_expr
]]

local handy = request('!.mechs.processor.handy')
local cho = handy.cho
local opt = handy.opt
local rep = handy.rep
local opt_rep = handy.opt_rep
local is_not = handy.is_not

local name = request('^.words.name')
local par_expr = request('^.expressions.par_expr')
local bracket_expr = request('^.expressions.bracket_expr')
local dot_name = request('^.expressions.dot_name')
local colon_name = request('^.expressions.colon_name')
local func_args = request('^.expressions.func_args')

local name_continuation =
  cho(bracket_expr, dot_name)

local call_args =
  {opt(colon_name), func_args}

return
  {
    name = 'function_call',
    cho(name, par_expr),
    rep(
      opt_rep(name_continuation),
      call_args
    ),
    is_not(name_continuation),
  }
