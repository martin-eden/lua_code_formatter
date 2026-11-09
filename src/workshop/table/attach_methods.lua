-- Attach methods table to object

--[[
  Author: Martin Eden
  Last mod.: 2026-11-10
]]

--[[
  This module exists to wrap common code:

    local me = { { } }
    local methods = { get_length = function(me) return #me[1] end }

  Instead of

    setmetatable(me, { __index = methods })

  We call

    attach_methods(me, methods)
]]

return
  function(me, methods)
    setmetatable(me, { __index = methods })
  end

--[[
  2026 # # #
]]
