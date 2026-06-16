local handy = request('!.mechs.processor.handy')
local list = handy.list

local name = request('^.words.name')
local syntel = request('^.words.syntel')

return
  {
    name = 'name_list',
    list(name, syntel(','))
  }
