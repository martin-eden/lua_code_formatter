local handy = request('!.mechs.processor.handy')
local list = handy.list

local syntel = request('^.words.syntel')

return
  {
    name = 'expr_list',
    list('>expression', syntel(',')),
  }
