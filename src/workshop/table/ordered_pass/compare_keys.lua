-- Keys comparator for sorting generic tables

--[[
  Author: Martin Eden
  Last mod.: 2026-08-28
]]

local compare_values = request('compare_values')

-- Export:
return
  function(A, B)
    return compare_values(A.key, B.key)
  end

--[[
  2016 #
  2017 #
]]
