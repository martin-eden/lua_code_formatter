--[[
  Variable reference grammar.

  Same structure as [function_call] but must not end at <call_args>.

  Sample:

    (a).b[c]:d()().e(f)(g){}"".h
            ~~~~~~  ~~~~~~~~~~   call_args
       ~~~~~      ~~          ~~ name_continuation
    ~~~                          name | par_expr
]]

local handy = request('!.mechs.processor.handy')
local cho = handy.cho
local opt = handy.opt
local rep = handy.rep
local opt_rep = handy.opt_rep
local is_not = handy.is_not

local name = request('^.words.name')
local par_expr = request('^.expressions.par_expr')
local colon_name = request('^.expressions.colon_name')
local func_args = request('^.expressions.func_args')
local bracket_expr = request('^.expressions.bracket_expr')
local dot_name = request('^.expressions.dot_name')

local call_args =
  {opt(colon_name), func_args}

local name_continuation =
  cho(bracket_expr, dot_name)

return
  {
    name = 'var_ref',
    cho(name, par_expr),
    opt_rep(
      opt_rep(call_args),
      name_continuation
    ),
    is_not(call_args),
  }
