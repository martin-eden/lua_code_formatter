local handy = request('!.mechs.processor.handy')

local opt_spc = request('^.words.opt_spc')

return
  {
    name = 'expr_list',
    handy.list('>expression', {opt_spc, ','}),
  }
