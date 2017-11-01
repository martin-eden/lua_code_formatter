local handy = request('!.mechs.processor.handy')

local word = request('^.words.word')
local statements = request('statements')

return
  {
    name = 'if_block',
    {
      name = 'if_part',
      word('if'),
      '>expression',
      word('then'),
      statements,
    },
    handy.opt_rep(
      {
        name = 'elseif_part',
        word('elseif'),
        '>expression',
        word('then'),
        statements,
      }
    ),
    handy.opt(
      {
        name = 'else_part',
        word('else'),
        statements,
      }
    ),
    word('end'),
  }
