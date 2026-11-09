-- Check that one segment is inside the other segment

--[[
  Author: Martin Eden
  Last mod.: 2026-11-19
]]

return
  function(seg_outer, seg_inner)
    return
      (seg_inner[1] >= seg_outer[1]) and
      (seg_inner[1] + seg_inner[2] <= seg_outer[1] + seg_outer[2])
  end

--[[
  2017
  2026-11-19
]]
