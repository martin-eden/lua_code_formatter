-- String-to-bool map of Lua keywords

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

local keywords = request('keywords')
local map_values = request('!.table.map_values')

return map_values(keywords)

--[[
  2026-11-12
]]
