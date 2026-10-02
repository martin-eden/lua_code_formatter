-- Normalize pathname

--[[
  Author: Martin Eden
  Last mod.: 2026-08-29
]]

--[[
  Normalizes string with POSIX path-name:

    "/.////a" -> "/a"
]]

local pathname_from_str = request('pathname_from_str')
local pathname_to_str = request('pathname_to_str')

-- Export:
return
  function(path_name)
    return pathname_to_str(pathname_from_str(path_name))
  end

--[[
  2018 #
]]
