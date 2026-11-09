-- Defuse all special regexp symbols in given string

--[[
  Author: Martin Eden
  Last mod.: 2026-11-15
]]

--[[
  Useful when you wish to pass to gsub() string with special
  characters with their literal meaning.

  Example

    quote('.') -> '%.'
    quote('%.') -> '%%%.'
]]

local magic_charset = request('magic_charset')
local str_gsub = string.gsub

return
  function(str)
    return str_gsub(str, magic_charset, '%%%0')
  end

--[[
  2018 #
  2024 #
]]
