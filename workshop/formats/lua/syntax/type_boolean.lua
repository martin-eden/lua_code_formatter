local parser = request('!.mechs.parser')
local handy = parser.handy

local word = request('words.word')

return
  {
    name = 'boolean',
    word(
      handy.cho('false', 'true')
    ),
  }
