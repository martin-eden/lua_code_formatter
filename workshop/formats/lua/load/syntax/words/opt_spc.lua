local handy = request('!.mechs.processor.handy')
local match_regexp = request('!.mechs.parser.handy').match_regexp

local comment = request('comment')

return
  {
    name = 'whitespace',
    handy.opt_rep(
      handy.cho(
        match_regexp('[ \t\n\r]+'),
        comment
      )
    )
  }
