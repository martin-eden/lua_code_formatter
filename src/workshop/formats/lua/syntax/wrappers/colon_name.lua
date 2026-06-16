local syntel = request('^.words.syntel')
local name = request('^.words.name')

return
  {
    name = 'colon_name',
    syntel(':'),
    name,
  }
