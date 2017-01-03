--[[
  This is lua code formatter.

  It receives adjusted parsed code and produces some text result
  of it.
]]

local formatter = request('formatter.interface')

return
  function(data_struc)
    assert_table(data_struc)
    formatter:init()
    formatter:process_node(data_struc)
    local result = formatter.printer:get_text()
    return result
  end
