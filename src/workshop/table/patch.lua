-- Replace values to values from another table

--[[
  Author: Martin Eden
  Last mod.: 2026-09-22
]]

--[[
  Existing values are overwritten:
    { a = 'A'}, { a = 'X' } -> { a = 'X' }

  New values are not added:
    { a = 'A'}, { b = 'B' } -> { a = 'A' }
]]

local Rules =
  {
    { has_a = true, has_b = true, action = 'replace' },
  }

local apply_table = request('apply_table')

return
  function(Result, Additions)
    apply_table(Result, Additions, Rules)
  end

--[[
  2016 #
  2024 # #
  2025 #
  2026 #
]]
