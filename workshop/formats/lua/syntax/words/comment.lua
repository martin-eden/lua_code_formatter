local handy = request('!.mechs.processor.handy')
local cho = handy.cho
local match_regexp = request('!.mechs.parser.handy').match_regexp

local long_bracket = request('particles.long_bracket')

--[[
  Comment grammar is part of <opt_spc>. So no spaces before "--".
]]

return
  {
    name = 'comment',
    '--',
    cho(
      long_bracket,
      match_regexp('[^\n\r]*[\n\r]?')
    )
  }
