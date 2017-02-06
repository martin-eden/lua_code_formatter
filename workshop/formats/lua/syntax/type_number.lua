local parser = request('!.mechs.parser')
local handy = parser.handy

local opt = handy.opt
local match_regexp = handy.match_regexp
local cho = handy.cho

local int_10 = match_regexp('%d+')
local dec_number =
  {
    cho(
      {'.', int_10},
      {int_10, opt('.', opt(int_10))}
    ),
    opt(match_regexp('[eE][%+%-]?%d+'))
  }

local int_16 = match_regexp('[%da-fA-F]+')
local hex_number =
  {
    match_regexp('0[xX]'),
    cho(
      {'.', int_16},
      {int_16, opt('.', opt(int_16))}
    ),
    opt(match_regexp('[pP][%+%-]?%d+'))
  }

--[[
  Hex number must be checked first, or it's "0" from prefix "0x"
  will be treated as decimal number "0".
]]

return {name = 'number', cho(hex_number, dec_number)}
