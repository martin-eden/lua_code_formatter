-- Map table values to keys

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

--[[
  Useful to check presence item in a list:

    { 'A', _ = 'a' } -> { ['A'] = true, ['a'] = true }
]]

return
  function(table)
    assert_table(table)
    local map = { }
    for _, value in pairs(table) do
      map[value] = true
    end
    return map
  end

--[[
  2016 #
  2024 #
  2025 #
]]
