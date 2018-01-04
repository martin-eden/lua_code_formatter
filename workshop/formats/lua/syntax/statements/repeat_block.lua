local handy = request('!.mechs.processor.handy')

local word = request('^.words.word')
local statements = request('statements')

return
  {
    name = 'repeat_block',
    word('repeat'),
    statements,
    word('until'),
    '>expression',
  }
