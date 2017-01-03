local parser = request('^.^.^.parser')
local handy = parser.handy

local name = request('name')
local opt_spc = request('opt_spc')

return
  {
    name = 'name_list',
    handy.list({opt_spc, name}, {opt_spc, ','})
  }
