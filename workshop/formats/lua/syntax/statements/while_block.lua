local handy = request('!.mechs.processor.handy')

local word = request('^.words.word')

return
  {
    name = 'while_block',
    word('while'),
    '>expression',
    word('do'),
    '>statements',
    word('end'),
  }
