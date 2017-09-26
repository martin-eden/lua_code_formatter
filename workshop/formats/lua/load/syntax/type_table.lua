local handy = request('!.mechs.processor.handy')

local name = request('words.name')
local bracket_expr = request('expressions.bracket_expr')
local opt_spc = request('words.opt_spc')

local key_val =
  {
    name = 'key_val',
    handy.opt(
      handy.cho(
        bracket_expr,
        name
      ),
      opt_spc, '='
    ),
    '>expression',
  }

local rec_sep =
  {
    opt_spc, handy.cho(',', ';'),
  }

return
  {
    name = 'table',
    opt_spc, '{',
    handy.opt(
      handy.list(key_val, rec_sep),
      handy.opt(rec_sep)
    ),
    opt_spc, '}',
  }
