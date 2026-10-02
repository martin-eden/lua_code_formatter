-- "repeat" statement grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-10-24
]]

local word = request('^.words.word')
local opt_spc = request('^.words.opt_spc')

return
  {
    name = 'repeat_block',
    word('repeat'),
    '>statements',
    opt_spc, word('until'),
    '>expression',
  }

--[[
  2016 #
  2018 #
  2026-10-24
]]
