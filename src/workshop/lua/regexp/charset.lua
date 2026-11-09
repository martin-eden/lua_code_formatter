-- Return regexp string to match character from list

--[[
  Author: Martin Eden
  Last mod.: 2026-11-15
]]

local list_to_str = request('!.concepts.list.to_string')
local defuse = request('!.lua.regexp.quote')
local to_charset = request('to_charset')

return
  function(chars)
    return to_charset(defuse(list_to_str(chars)))
  end

--[[
  2026-11-15
]]
