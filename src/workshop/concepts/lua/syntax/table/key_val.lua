--[[
  Grammar for key-value pair in table definition.

  <key_val>:

    -+------------------------------+- <expression> -
     +---+- <bracket_expr> -+- "=" -+
         +- <name> ---------+
]]

local handy = request('!.mechs.processor.handy')
local opt = handy.opt
local cho = handy.cho

local bracket_expr = request('^.wrappers.bracket_expr')
local name = request('^.words.name')
local syntel = request('^.words.syntel')

return
  {
    name = 'key_val',
    opt(
      cho(
        bracket_expr,
        name
      ),
      syntel('=')
    ),
    '>expression',
  }
