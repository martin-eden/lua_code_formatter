-- Grammar for boolean value

--[[
  Author: Martin Eden
  Last mod.: 2026-10-22
]]

local opt_spc = request('words.opt_spc')
local word = request('words.word')
local cho = request('!.mechs.processor.handy').cho

return
  {
    opt_spc,
    {
      name = 'boolean',
      cho(word('false'), word('true')),
    },
  }

--[[
  2016 #
  2018 #
]]
