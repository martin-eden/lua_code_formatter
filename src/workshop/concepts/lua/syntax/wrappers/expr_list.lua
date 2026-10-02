-- Expressions list grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-10-25
]]

local list = request('!.mechs.processor.handy').list

return { name = 'expr_list', list('>expression', ',') }

--[[
  2016 #
  2018 #
  2026-10-25
]]
