-- Attach methods table to object

--[[
  Author: Martin Eden
  Last mod.: 2026-10-14
]]

--[[
  This module exists to wrap common code:

    local Object = { Data = { } }
    local Methods = { GetLength = function(Me) return #Me.Data end }

  Instead of

    setmetatable(Object, { __index = Methods })

  We call

    attach_methods(Object, Methods)
]]

-- Export:
return
  function(Object, Methods)
    assert_table(Object)
    assert_table(Methods)

    setmetatable(Object, { __index = Methods })
  end

--[[
  2026 # #
  2026-10-14
]]
