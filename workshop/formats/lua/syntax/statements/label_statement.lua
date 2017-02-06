local name = request('^.words.name')
local opt_spc = request('^.words.opt_spc')

return
  {
    name = 'label_statement',
    '::',
    opt_spc, name,
    opt_spc, '::',
  }
