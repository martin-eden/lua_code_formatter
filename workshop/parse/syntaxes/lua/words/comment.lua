local parser = request('^.^.^.parser')
local handy = parser.handy

local long_bracket = request('particles.long_bracket')

return
  {
    '--',
    handy.cho1(
      long_bracket,
      handy.match_pattern('[^\n\r]*')
    )
  }
