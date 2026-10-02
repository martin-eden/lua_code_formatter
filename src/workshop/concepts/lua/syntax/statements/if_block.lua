-- "if" statement syntax

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

local opt_spc = request('^.words.opt_spc')
local word = request('^.words.word')

local handy = request('!.mechs.processor.handy')
local opt = handy.opt
local opt_rep = handy.opt_rep

return
  {
    name = 'if_block',
    {
      name = 'if_part',
      word('if'),
      '>expression',
      opt_spc, word('then'),
      '>statements',
    },
    opt_rep(
      {
        name = 'elseif_part',
        opt_spc, word('elseif'),
        '>expression',
        opt_spc, word('then'),
        '>statements',
      }
    ),
    opt(
      {
        name = 'else_part',
        opt_spc, word('else'),
        '>statements',
      }
    ),
    opt_spc, word('end'),
  }

--[[
  2016 #
  2018 # #
  2026-10-23
]]
