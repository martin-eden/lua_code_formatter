local word = request('^.words.word')

return
  {
    name = 'do_block',
    word('do'),
    '>statements',
    word('end'),
  }
