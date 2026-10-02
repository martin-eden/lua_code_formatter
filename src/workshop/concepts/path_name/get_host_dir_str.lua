-- Return string host directory for pathname string

--[[
  Author: Martin Eden
  Last mod.: 2026-09-10
]]

local pathname_from_str = request('pathname_from_str')
local pathname_to_str = request('pathname_to_str')
local get_host_dir = request('get_host_dir')

-- Export:
return
  function(pathname)
    return pathname_to_str(get_host_dir(pathname_from_str(pathname)))
  end

--[[
  2026-09-10
]]
