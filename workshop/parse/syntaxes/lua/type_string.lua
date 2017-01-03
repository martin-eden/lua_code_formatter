local parser = request('^.^.parser')
local handy = parser.handy

local long_bracket = request('words.particles.long_bracket')
local any_char = request('words.particles.any_char')

local linear_string_char =
  handy.cho1(
    {
      [[\]],
      any_char
    },
    any_char
  )

return
  {
    name = 'string',
    handy.cho1(
      long_bracket,
      {
        '"',
        handy.opt_rep(
          handy.is_not('"'),
          linear_string_char
        ),
        '"'
      },
      {
        "'",
        handy.opt_rep(
          handy.is_not("'"),
          linear_string_char
        ),
        "'"
      }
    )
  }
