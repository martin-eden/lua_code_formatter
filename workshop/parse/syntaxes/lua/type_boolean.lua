local parser = request('^.^.parser')
local handy = parser.handy

local word = request('words.word')

return
  {
    name = 'boolean',
    word(
      handy.cho1('false', 'true')
    ),
  }
