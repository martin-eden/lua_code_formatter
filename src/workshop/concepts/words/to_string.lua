-- Represent words as string

--[[
  Author: Martin Eden
  Last mod.: 2026-09-14
]]

local list_to_string = request('!.concepts.list.to_string')

-- Export:
return
  function(Words)
    return list_to_string(Words, ' ')
  end

--[[
  2026 #
]]
