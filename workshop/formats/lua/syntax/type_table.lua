local handy = request('!.mechs.processor.handy')
local opt = handy.opt
local cho = handy.cho
local list = handy.list

local name = request('words.name')
local bracket_expr = request('expressions.bracket_expr')
local syntel = request('words.syntel')

local key_val =
  {
    name = 'key_val',
    opt(
      cho(
        bracket_expr,
        name
      ),
      syntel('=')
    ),
    '>expression',
  }

local rec_sep =
  {
    cho(syntel(','), syntel(';'))
  }

return
  {
    name = 'table',
    syntel('{'),
    opt(
      list(key_val, rec_sep),
      opt(rec_sep)
    ),
    syntel('}'),
  }
