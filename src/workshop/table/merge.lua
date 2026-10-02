-- Add values from another table

--[[
  Author: Martin Eden
  Last mod.: 2026-09-22
]]

--[[
  Existing values are preserved:
    { a = 'A'}, { a = 'X' } -> { a = 'A' }

  New values are added:
    { a = 'A'}, { b = 'B' } -> { a = 'A', b = 'B' }
]]

local Rules =
  {
    { has_a = false, has_b = true, action = 'replace' },
  }

local apply_table = request('apply_table')

return
  function(Result, Additions)
    apply_table(Result, Additions, Rules)
  end

--[[
  2016 # #
  2017 #
  2019 #
  2024 #
  2025 #
  2026 # #
]]
