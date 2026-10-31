-- Check that representation is acceptable

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

return
  function(Me, Representation)
    return (Representation:GetWidth() <= Me[1])
  end

--[[
  2017 # #
  2026-10-23
]]
