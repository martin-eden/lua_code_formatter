-- Return string with regexp to match any of regexp special character

--[[
  Author: Martin Eden
  Last mod.: 2026-10-14
]]

local magic_chars = request('magic_chars')
local str_gsub = string.gsub

return '[' .. str_gsub(magic_chars, '.', '%%%0') .. ']'

--[[
  2018 #
]]
