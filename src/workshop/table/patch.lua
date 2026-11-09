-- Replace values to values from another table

--[[
  Author: Martin Eden
  Last mod.: 2026-11-10
]]

--[[
  Existing values are overwritten:
    { a = 'A'}, { a = 'X' } -> { a = 'X' }

  New values are not added:
    { a = 'A'}, { b = 'B' } -> { a = 'A' }
]]

local rule = { true, true, 'replace' }
local apply_table = request('apply_table')

return
  function(result, patch)
    apply_table(result, patch, rule)
  end

--[[
  2016 #
  2024 # #
  2025 #
  2026 #
]]
