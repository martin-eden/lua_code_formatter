-- Regexp-quote all special regexp symbols in given string

--[[
  Author: Martin Eden
  Last mod.: 2026-10-14
]]

--[[
  Useful when you wish to pass to gsub() string with special
  characters with their literal meaning.

  Example:

    quote('.') -> '%.'
    quote('%.') -> '%%%.'
]]

local magic_char_pattern = request('magic_char_pattern')
local str_gsub = string.gsub

return
  function(str)
    return str_gsub(str, magic_char_pattern, '%%%0')
  end

--[[
  2018-02-05
  2024-10-20
]]
