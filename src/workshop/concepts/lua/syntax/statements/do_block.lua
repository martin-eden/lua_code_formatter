-- "do" block grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-10-22
]]

local opt_spc = request('^.words.opt_spc')
local word = request('^.words.word')

return
  {
    name = 'do_block',
    opt_spc,
    word('do'),
    '>statements',
    opt_spc,
    word('end'),
  }

--[[
  2016 #
  2018 # #
  2026-10-22
]]
