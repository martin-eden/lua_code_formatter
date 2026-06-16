local handy = request('!.mechs.processor.handy')
local opt_rep = handy.opt_rep
local cho = handy.cho
local match_regexp = request('!.mechs.parser.handy').match_regexp

local comment = request('comment')

return
  {
    name = 'whitespace',
    opt_rep(
      cho(
        match_regexp('[ \t\n\r]+'),
        comment
      )
    )
  }
