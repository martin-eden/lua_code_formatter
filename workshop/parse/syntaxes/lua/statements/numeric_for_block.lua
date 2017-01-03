local parser = request('^.^.^.parser')
local handy = parser.handy

local word = request('^.words.word')
local opt_spc = request('^.words.opt_spc')
local name = request('^.words.name')
local statements = request('statements')

return
  handy.interleave(
    {
      name = 'numeric_for_block',
      word('for'),
      name,
      '=',
      '>expression',
      ',',
      '>expression',
      handy.opt(
        ',',
        opt_spc,
        '>expression'
      ),
      word('do'),
      statements,
      word('end'),
    },
    opt_spc
  )
