-- Grammar for name

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

local tokens_accessor = request('!.concepts.lua.tokens_accessor')

return { name = 'name', tokens_accessor.is_name }

--[[
  2026-10-25
  2026-10-27
]]
