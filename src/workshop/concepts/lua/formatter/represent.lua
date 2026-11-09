-- Print node to our virtual printer

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

--[[
  We're creating new virtual printer with current settings
  but without previous text (except "last line with text").

  Then we're calling serializer with that printer.

  We're returning printer's instance. If it's result is accepted
  it can me merged to higher-level result.
]]

return
  function(me, represent, node)
    local original_printer = me[1]
    local trial_printer = original_printer:seed()

    me[1] = trial_printer
    local has_failed = not represent(me, node)
    me[1] = original_printer

    return trial_printer, has_failed
  end

--[[
  2017 # #
  2026 #
  2026-10-31
]]
