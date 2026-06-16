--[[
  Shortcut structure to prefix punctiation characters with optional
  spaces.

  So instead of "opt_spc, ','" you may write "syntel(',')".
]]

local opt_spc = request('opt_spc')

return
  function(str)
    return {opt_spc, str}
  end
