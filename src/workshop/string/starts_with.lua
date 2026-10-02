-- Return true if string starts with given string

--[[
  Author: Martin Eden
  Last mod.: 2026-08-28
]]

local str_sub = string.sub

-- Export:
return
  function(base_str, prefix_str)
    return (str_sub(base_str, 1, #prefix_str) == prefix_str)
  end

--[[
  2026-04-23
  2026-08-28
]]
