-- Return list segment as list

--[[
  Author: Martin Eden
  Last mod.: 2026-09-10
]]

local is_natural = request('!.number.is_natural')
local tbl_move = table.move

-- Export:
return
  function(List, start_idx, len)
    assert(is_natural(start_idx))
    assert(is_natural(len))

    local stop_idx = start_idx + len - 1

    local Result = { }
    tbl_move(List, start_idx, stop_idx, 1, Result)

    return Result
  end

--[[
  2026-05-02
  2026-09-10
]]
