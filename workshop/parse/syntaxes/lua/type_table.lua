local parser = request('^.^.parser')
local handy = parser.handy

local name = request('words.name')
local bracket_expr = request('expressions.bracket_expr')
local opt_spc = request('words.opt_spc')

local key_val =
  {
    name = 'key_val',
    handy.opt(
      {
        handy.cho1(
          bracket_expr,
          name
        ),
        opt_spc, '=',
        opt_spc,
      }
    ),
    '>expression',
  }

local rec_sep =
  {
    opt_spc, handy.cho1(',', ';'),
  }

return
  {
    name = 'table',
    '{',
    handy.opt(
      handy.list({opt_spc, key_val}, rec_sep),
      handy.opt(rec_sep)
    ),
    opt_spc, '}',
  }
