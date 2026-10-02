-- Return true if string ends with given string

--[[
  Author: Martin Eden
  Last mod.: 2026-08-28
]]

local str_sub = string.sub

-- Export:
return
  function(base_str, postfix_str)
    return (str_sub(base_str, -#postfix_str, -1) == postfix_str)
  end

--[[
  2026-04-23
  2026-08-28
]]
