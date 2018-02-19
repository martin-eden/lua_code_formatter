local syntel = request('^.words.syntel')

return
  {
    name = 'vararg',
    syntel('...'),
  }
