-- Merge destination table. Override existing fields in source table

--[[
  Author: Martin Eden
  Last mod.: 2026-11-10
]]

local merge = request('merge')
local patch = request('patch')

return
  function(dest, additions)
    if not additions then return end
    merge(dest, additions)
    patch(dest, additions)
  end

--[[
  2024 #
  2026 # #
  2026-11-04
]]
