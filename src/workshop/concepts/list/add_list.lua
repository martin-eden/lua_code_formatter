-- Add another list to our list

--[[
  Author: Martin Eden
  Last mod.: 2026-09-10
]]

local tbl_move = table.move

-- Export:
return
  function(OurList, AnotherList)
    assert(OurList ~= AnotherList)
    tbl_move(AnotherList, 1, #AnotherList, #OurList + 1, OurList)
  end

--[[
  2026-05-02
  2026-09-10
]]
