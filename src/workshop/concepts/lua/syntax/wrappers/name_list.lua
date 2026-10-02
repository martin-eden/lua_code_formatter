-- Grammar for list of names

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

local name = request('^.words.name')
local syntel = request('^.words.syntel')
local list = request('!.mechs.processor.handy').list

return { name = 'name_list', list(name, syntel(',')) }

--[[
  2016 #
  2018 #
]]
