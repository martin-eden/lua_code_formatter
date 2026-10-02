-- Print node to our virtual printer

--[[
  Author: Martin Eden
  Last mod.: 2026-10-22
]]

--[[
  We're creating new virtual printer with current settings
  but without previous text (except "last line with text").

  Then we're calling serializer with that printer.

  We're returning printer's instance. If it's result is accepted
  it can me merged to higher-level result.
]]

local TextBlock = request('!.mechs.TextBlock')

return
  function(Me, representer, Node)
    local Original = Me.printer
    local Trial = Original:Seed()

    Me.printer = Trial
    local has_failed = not representer(Me, Node)
    Me.printer = Original

    return Trial, has_failed
  end

--[[
  2017 # #
  2026-10-22
]]
