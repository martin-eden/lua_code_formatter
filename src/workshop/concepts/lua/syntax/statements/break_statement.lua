-- "Break" statement grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-10-22
]]

local word = request('^.words.word')

return { name = 'break_statement', word('break') }

--[[
  2016 #
  2026-10-22
]]
