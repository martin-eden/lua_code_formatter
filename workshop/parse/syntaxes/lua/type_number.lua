local parser = request('^.^.parser')
local handy = parser.handy

local dec_number = request('type_number.dec_number')
local hex_number = request('type_number.hex_number')

return
  {
    name = 'number',
    handy.cho1(hex_number, dec_number)
  }
