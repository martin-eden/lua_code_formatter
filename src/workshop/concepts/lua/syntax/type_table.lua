--[[
  Table definition grammar.

  <table>:

    - "{" -+---------------------------+- "}" -
           | ------------------------- |
           | V                       / |
           +--- <key_val> -+- "," -+---+
                           +- ";" -+   |
                           +-----------+
]]

local handy = request('!.mechs.processor.handy')
local opt = handy.opt
local cho = handy.cho
local list = handy.list

local syntel = request('words.syntel')
local key_val = request('table.key_val')

local rec_sep =
  {
    cho(syntel(','), syntel(';'))
  }

return
  {
    name = 'table',
    syntel('{'),
    opt(
      list(key_val, rec_sep),
      opt(rec_sep)
    ),
    syntel('}'),
  }
