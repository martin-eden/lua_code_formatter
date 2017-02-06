local parser = request('!.mechs.parser')
local handy = parser.handy

local opt_rep = handy.opt_rep
local match_regexp = handy.match_regexp
local cho = handy.cho

local long_bracket = request('words.particles.long_bracket')

return
  {
    name = 'string',
    cho(
      long_bracket,
      {
        '"',
        opt_rep(
          cho(
            match_regexp([[[^%\%"]+]]),
            match_regexp([[%\.]])
          )
        ),
        '"'
      },
      {
        "'",
        opt_rep(
          cho(
            match_regexp([[[^%\%']+]]),
            match_regexp([[%\.]])
          )
        ),
        "'"
      }
    )
  }
