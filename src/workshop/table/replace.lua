-- Replace contents of table

--[[
  Author: Martin Eden
  Last mod.: 2026-11-10
]]

local patch = request('patch')
local intersect = request('intersect')
local merge = request('merge')

return
  function(origin, replacement)
    intersect(origin, replacement)
    patch(origin, replacement)
    merge(origin, replacement)
  end

--[[
  2018 #
  2026 #
]]
