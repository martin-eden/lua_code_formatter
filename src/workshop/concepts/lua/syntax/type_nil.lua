-- Grammar for "nil" value

--[[
  Author: Martin Eden
  Last mod.: 2026-10-22
]]

local opt_spc = request('words.opt_spc')
local word = request('words.word')

return { opt_spc, { name = 'nil', word('nil') } }

--[[
  2016 #
]]
