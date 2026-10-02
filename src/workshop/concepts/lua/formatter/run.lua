-- Run formatter

--[[
  Author: Martin Eden
  Last mod.: 2026-10-24
]]

return
  function(Me)
    Me.is_ok = Me:process_node(Me.data_struc)

    return Me:get_result()
  end

--[[
  2018 #
  2026 #
  2026-10-24
]]
