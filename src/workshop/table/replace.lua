-- Replace contents of table

--[[
  Author: Martin Eden
  Last mod.: 2026-09-22
]]

local Rules =
  {
    { has_a = true, has_b = true, action = 'replace' },
    { has_a = false, has_b = true, action = 'replace' },
    { has_a = true, has_b = false, action = 'remove' },
  }

local apply_table = request('apply_table')

return
  function(Dest, Src)
    apply_table(Dest, Src, Rules)
  end

--[[
  2018 #
  2026 #
]]
