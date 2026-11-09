-- Represent words as string

--[[
  Author: Martin Eden
  Last mod.: 2026-11-14
]]

local space = request('!.concepts.ascii.chars').space
local list_to_string = request('!.concepts.list.to_string')

return
  function(words)
    return list_to_string(words, space)
  end

--[[
  2026 #
]]
