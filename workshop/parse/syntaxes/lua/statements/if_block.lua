local parser = request('^.^.^.parser')
local handy = parser.handy

local word = request('^.words.word')
local opt_spc = request('^.words.opt_spc')
local statements = request('statements')

return
  {
    name = 'if_block',
    {
      name = 'if_part',
      word('if'),
      opt_spc, '>expression',
      opt_spc, word('then'),
      opt_spc, statements,
    },
    handy.opt_rep(
      {
        name = 'elseif_part',
        opt_spc, word('elseif'),
        opt_spc, '>expression',
        opt_spc, word('then'),
        opt_spc, statements,
      }
    ),
    handy.opt(
      {
        name = 'else_part',
        opt_spc, word('else'),
        opt_spc, statements,
      }
    ),
    opt_spc, word('end'),
  }
