local handy = request('!.mechs.processor.handy')
local list = handy.list

local name = request('name')
local syntel = request('syntel')

return
  {
    name = 'name_list',
    list(name, syntel(','))
  }
