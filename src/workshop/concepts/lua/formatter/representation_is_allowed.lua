-- Check that representation is acceptable

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

return
  function(Me, Representation)
    return (Representation:GetWidth() <= Me.right_margin)
  end

--[[
  2017 # #
  2026-10-23
]]
