local parser = request('!.mechs.parser')
local handy = parser.handy

local word = request('^.words.word')
local opt_spc = request('^.words.opt_spc')
local statements = request('statements')

return
  handy.interleave(
    {
      name = 'repeat_block',
      word('repeat'),
      statements,
      word('until'),
      '>expression',
    },
    opt_spc
  )
