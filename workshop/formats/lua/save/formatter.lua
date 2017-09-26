--[[
  This is lua code formatter.

  It receives table with parsed syntax and returns string with
  formatted code.
]]

local formatter_class = request('formatter.interface')

return
  function(data_struc, options)
    local formatter = new(formatter_class, options)
    formatter.data_struc = data_struc
    formatter:init()
    formatter:run()
    return formatter:get_result()
  end
