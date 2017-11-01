local handy = request('!.mechs.processor.handy')

local word = request('words.word')

return
  {
    name = 'boolean',
    handy.cho(word('false'), word('true')),
  }
