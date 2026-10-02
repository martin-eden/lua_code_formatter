-- Structural shortcut for syntax element

--[[
  Author: Martin Eden
  Last mod.: 2026-10-21
]]

--[[
  Intention is to simplify grammar definitions by replacing
  "opt_spc, ','" with "syntel(',')".

  Unlike [word] implementation here does not enforce that
  next character is not punctuation.

  Don't use this element if you want to capture syntax element
  value -- { name = 'vararg', syntel('...') } will also capture
  possible leading spaces before "...".
]]

local opt_spc = request('opt_spc')

return
  function(str)
    return { opt_spc, str }
  end

--[[
  2018 #
  2026-10-21
]]
