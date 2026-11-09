-- Named ASCII characters

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

local codes = request('codes')
local str_char = string.char

chars = { }
for name, code in pairs(codes) do
  chars[name] = str_char(code)
end

return chars

--[[
  2026-08-01
  2026-08-07
]]
