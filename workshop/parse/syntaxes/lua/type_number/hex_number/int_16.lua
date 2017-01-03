local parser = request('^.^.^.^.parser')
local handy = parser.handy

local digit_16 = request('digit_16')

return handy.rep(digit_16)
