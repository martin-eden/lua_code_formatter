local syntel = request('^.words.syntel')
local name = request('^.words.name')

return
  {
    name = 'dot_name',
    syntel('.'),
    name
  }
