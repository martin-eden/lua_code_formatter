local handy = request('!.mechs.processor.handy')
local match_regexp = request('!.mechs.parser.handy').match_regexp

local long_bracket = request('particles.long_bracket')

return
  {
    name = 'comment',
    '--',
    handy.cho(
      long_bracket,
      match_regexp('[^\n\r]*[\n\r]?')
    )
  }
