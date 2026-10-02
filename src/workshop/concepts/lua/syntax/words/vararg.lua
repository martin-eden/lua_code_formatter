-- Variable argument grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-10-21
]]

-- We don't use [syntel] because we want to have capture without spaces

local opt_spc = request('^.words.opt_spc')

return
  {
    opt_spc,
    {
      name = 'vararg',
      '...',
    },
  }

--[[
  2016 #
  2017 #
  2018 #
  2026-20-21
]]
