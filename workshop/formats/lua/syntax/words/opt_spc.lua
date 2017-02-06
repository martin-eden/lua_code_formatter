local parser = request('!.mechs.parser')
local handy = parser.handy

local comment = request('comment')

return
  handy.opt_rep(
    handy.cho(
      handy.match_regexp('[ \t\n\r]+'),
      comment
    )
  )
