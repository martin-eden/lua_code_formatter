local name = request('^.words.name')
local syntel = request('^.words.syntel')

return
  {
    name = 'label_statement',
    syntel('::'),
    name,
    syntel('::'),
  }
