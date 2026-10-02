--[[
  Number literals grammar.

  <number>:

    - <opt_spc> -+- <hex_number> -+-
                 +- <dec_number> -+

  <hex_number>:

    - "0" -+- "x" -+---+- "." <int_16> ----------------------+- ...
           +- "X" -+   +- <int_16> -+----------------------+-+
                                    +- "." -+------------+-+
                                            +- <int_16> -+

    -+------------------------------------+-
     +-+- "p" -+---+-------+--- <int_10> -+
       +- "P" -+   +- "+" -+
                   +- "-" -+

  <dec_number>:

    -+- "." <int_10> ----------------------+- ...
     +- <int_10> -+----------------------+-+
                  +- "." -+------------+-+
                          +- <int_10> -+

    -+------------------------------------+-
     +-+- "e" -+---+-------+--- <int_10> -+
       +- "E" -+   +- "+" -+
                   +- "-" -+

  Order

    <hex_number> must be checked first. Or it's "0" from prefix "0x"
    will be treated as decimal <dec_number> "0".
]]

local handy = request('!.mechs.processor.handy')
local opt = handy.opt
local cho = handy.cho
local match_regexp = request('!.mechs.parser.handy').match_regexp

local opt_spc = request('words.opt_spc')

local int_16 = match_regexp('%x+')
local hex_number =
  {
    match_regexp('0[xX]'),
    cho(
      {'.', int_16},
      {int_16, opt('.', opt(int_16))}
    ),
    opt(match_regexp('[pP][%+%-]?%d+'))
  }

local int_10 = match_regexp('%d+')
local dec_number =
  {
    cho(
      {'.', int_10},
      {int_10, opt('.', opt(int_10))}
    ),
    opt(match_regexp('[eE][%+%-]?%d+'))
  }

return
  {
    name = 'number',
    opt_spc,
    cho(
      hex_number,
      dec_number
    )
  }
