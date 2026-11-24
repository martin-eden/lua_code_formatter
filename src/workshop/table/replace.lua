-- Replace contents of table

--[[
  Author: Martin Eden
  Last mod.: 2026-11-24
]]

--[[
  It may be implemented as ( intersect patch merge ) but those
  are "deep" functions and they create problems when
  "origin" and "replacement" table have common keys and values.
]]

return
  function(origin, replacement)
    for k in pairs(origin) do
      origin[k] = nil
    end
    for k, v in pairs(replacement) do
      origin[k] = v
    end
  end

--[[
  2018 #
  2026 #
  2026-11-24
]]
