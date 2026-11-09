-- Return list segment as list

--[[
  Author: Martin Eden
  Last mod.: 2026-11-11
]]

local is_natural = request('!.number.is_natural')
local tbl_move = table.move

return
  function(list, start_idx, len)
    assert(is_natural(start_idx))
    assert(is_natural(len))

    local stop_idx = start_idx + len - 1

    local result = { }
    tbl_move(list, start_idx, stop_idx, 1, result)

    return result
  end

--[[
  2026 # #
]]
