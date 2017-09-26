local handy = request('!.mechs.processor.handy')

local word = request('^.words.word')
local opt_spc = request('^.words.opt_spc')
local name = request('^.words.name')
local statements = request('statements')

return
  {
    name = 'numeric_for_block',
    word('for'),
    name,
    opt_spc, '=',
    '>expression',
    opt_spc, ',',
    '>expression',
    handy.opt(
      opt_spc, ',',
      '>expression'
    ),
    word('do'),
    statements,
    word('end'),
  }
