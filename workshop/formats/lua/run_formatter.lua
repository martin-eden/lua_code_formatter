--[[
  Serialize Lua code AST to string with actual Lua code.

  It receives table with parsed syntax and returns string with
  formatted code.

  table -> str
]]

local c_formatter = request('formatter.interface')

return
  function(data_struc, options)
    local formatter = new(c_formatter, options)
    formatter.data_struc = data_struc
    formatter:init()
    return formatter:run()
  end
