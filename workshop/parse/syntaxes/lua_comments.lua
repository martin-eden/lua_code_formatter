local parser = request('^.parser')
local handy = parser.handy

local cho = handy.cho
local rep = handy.rep
local opt_rep = handy.opt_rep
local is_not = handy.is_not

local comment = request('lua.words.comment')
comment.name = 'comment'
local type_string = request('lua.type_string')
type_string.name = nil
local any_char = request('lua.words.particles.any_char')

return
  {
    opt_rep(
      cho(
        comment,
        {
          name = 'code',
          cho(type_string, any_char),
        }
      )
    ),
  }
