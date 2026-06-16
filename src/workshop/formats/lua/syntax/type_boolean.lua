local handy = request('!.mechs.processor.handy')
local cho = handy.cho

local word = request('words.word')

return
  {
    name = 'boolean',
    cho(word('false'), word('true')),
  }
