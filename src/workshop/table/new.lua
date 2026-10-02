-- Copy table and maybe override fields

--[[
  Author: Martin Eden
  Last mod.: 2026-08-28
]]

local clone = request('clone')
local patch = request('patch')

-- Export:
return
  function(Base, Overrides)
    assert_table(Base)

    local Result = clone(Base)

    if is_table(Overrides) then
      patch(Result, Overrides)
    end

    return Result
  end

--[[
  2016 #
]]
