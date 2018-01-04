local syntel = request('^.words.syntel')

return
  {
    name = 'bracket_expr',
    syntel('['),
    '>expression',
    syntel(']'),
  }
