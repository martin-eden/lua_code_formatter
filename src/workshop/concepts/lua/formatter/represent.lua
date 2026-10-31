-- Print node to our virtual printer

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

--[[
  We're creating new virtual printer with current settings
  but without previous text (except "last line with text").

  Then we're calling serializer with that printer.

  We're returning printer's instance. If it's result is accepted
  it can me merged to higher-level result.
]]

return
  function(Me, representer, Node)
    local OriginalPrinter = Me[2]
    local TrialPrinter = OriginalPrinter:Seed()

    Me[2] = TrialPrinter
    local has_failed = not representer(Me, Node)
    Me[2] = OriginalPrinter

    return TrialPrinter, has_failed
  end

--[[
  2017 # #
  2026 #
  2026-10-31
]]
