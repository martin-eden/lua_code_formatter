-- Keep in table A only keys that are present in table B

--[[
  Author: Martin Eden
  Last mod.: 2026-11-10
]]

local rule = { true, false, 'remove' }
local apply_table = request('apply_table')

return
  function(a, b)
    apply_table(a, b, rule)
  end

--[[
  2026-07-12
]]
