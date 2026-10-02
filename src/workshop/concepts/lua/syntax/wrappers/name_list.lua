-- Grammar for list of names

--[[
  Author: Martin Eden
  Last mod.: 2026-10-25
]]

local name = request('^.words.name')
local list = request('!.mechs.processor.handy').list

return { name = 'name_list', list(name, ',') }

--[[
  2016 #
  2018 #
  2026-10-25
]]
