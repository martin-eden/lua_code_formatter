-- "generic for" grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

local word = request('^.words.word')
local opt_spc = request('^.words.opt_spc')
local name_list = request('^.wrappers.name_list')
local expr_list = request('^.wrappers.expr_list')

return
  {
    name = 'generic_for_block',
    word('for'),
    name_list,
    opt_spc, word('in'),
    expr_list,
    opt_spc, word('do'),
    '>statements',
    opt_spc, word('end'),
  }

--[[
  2016 #
  2018 #
  2026-10-23
]]
