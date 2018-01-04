local handy = request('!.mechs.processor.handy')
local opt = handy.opt
local opt_rep = handy.opt_rep

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
    opt_rep(
      {
        name = 'elseif_part',
        word('elseif'),
        '>expression',
        word('then'),
        statements,
      }
    ),
    opt(
      {
        name = 'else_part',
        word('else'),
        statements,
      }
    ),
    word('end'),
  }
