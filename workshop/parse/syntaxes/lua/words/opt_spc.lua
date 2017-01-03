local parser = request('^.^.^.parser')
local handy = parser.handy

local comment = request('comment')

return
  handy.opt_rep(
    handy.cho1(
      handy.match_pattern('[ \t\n\r]+'),
      comment
    )
  )
