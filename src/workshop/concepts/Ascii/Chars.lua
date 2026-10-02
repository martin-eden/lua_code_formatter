-- Named ASCII characters

--[[
  Author: Martin Eden
  Last mod.: 2026-08-07
]]

local Chars
do
  local Codes = request('Codes')
  local str_char = string.char

  Chars = { }

  for name, code in pairs(Codes) do
    Chars[name] = str_char(code)
  end
end

-- Export:
return Chars

--[[
  2026-08-01
  2026-08-07
]]
