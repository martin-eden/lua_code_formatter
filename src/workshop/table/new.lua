-- Copy table and maybe override fields

--[[
  Author: Martin Eden
  Last mod.: 2026-11-10
]]

local clone = request('clone')
local patch = request('patch')

return
  function(base, overrides)
    assert_table(base)

    local result = clone(base)

    if overrides then
      patch(result, overrides)
    end

    return result
  end

--[[
  2016 #
]]
