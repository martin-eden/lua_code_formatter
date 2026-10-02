-- "while" statement serialization

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

local handy = request('!.mechs.processor.handy')

local word = request('^.words.word')
local opt_spc = request('^.words.opt_spc')

return
  {
    name = 'while_block',
    word('while'),
    '>expression',
    opt_spc, word('do'),
    '>statements',
    opt_spc, word('end'),
  }

--[[
  2016 #
  2018 # #
  2026-10-23
]]
