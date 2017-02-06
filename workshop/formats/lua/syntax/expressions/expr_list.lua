local parser = request('!.mechs.parser')
local handy = parser.handy

local opt_spc = request('^.words.opt_spc')

return
  {
    name = 'expr_list',
    handy.list({opt_spc, '>expression'}, {opt_spc, ','}),
  }
