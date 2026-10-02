-- Initialize formatter

--[[
  Author: Martin Eden
  Last mod.: 2026-10-22
]]

local TextBlock = request('!.mechs.TextBlock')

return
  function(Me)
    Me.printer = TextBlock.create(Me.indent_chunk)
    Me.state_keeper:init()

    assert_table(Me.data_struc)
  end

--[[
  2016 #
  2017 # # #
  2018 #
]]
