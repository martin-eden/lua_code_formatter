-- Keys comparator for sorting generic tables

--[[
  Author: Martin Eden
  Last mod.: 2026-11-10
]]

local compare_values = request('compare_values')

return
  function(a, b)
    return compare_values(a.key, b.key)
  end

--[[
  2016 #
  2017 #
]]
