-- Grammar for name

--[[
  Author: Martin Eden
  Last mod.: 2026-10-27
]]

local TokensAccessor = request('!.concepts.lua.TokensAccessor')

return { name = 'name', TokensAccessor.IsName }

--[[
  2026-10-25
  2026-10-27
]]
