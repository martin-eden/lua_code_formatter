local syntel = request('^.words.syntel')

return
  {
    name = 'par_expr',
    syntel('('),
    '>expression',
    syntel(')'),
  }
