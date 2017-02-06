local opt_spc = request('^.words.opt_spc')

return
  {
    name = 'bracket_expr',
    '[',
    opt_spc, '>expression',
    opt_spc, ']',
  }
