local parser = request('!.mechs.parser')
local handy = parser.handy

local long_bracket = request('particles.long_bracket')

return
  {
    '--',
    handy.cho(
      long_bracket,
      handy.match_regexp('[^\n\r]*')
    )
  }
