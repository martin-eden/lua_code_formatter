-- "Numeric for" statement grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-10-24
]]

local handy = request('!.mechs.processor.handy')
local opt = handy.opt

local word = request('^.words.word')
local name = request('^.words.name')
local syntel = request('^.words.syntel')
local opt_spc = request('^.words.opt_spc')

return
  {
    name = 'numeric_for_block',
    word('for'),
    name,
    syntel('='),
    '>expression',
    syntel(','),
    '>expression',
    opt(
      syntel(','),
      '>expression'
    ),
    opt_spc, word('do'),
    '>statements',
    opt_spc, word('end'),
  }

--[[
  2016 #
  2018 #
  2026-10-24
]]
