--[[
  Simplified interface for [generic_file_converter].
]]

local c_converter = request('!.frontend.text.generic_file_converter.interface')

return
  function(params)
    local coverter = new(c_converter, params)
    coverter:init()
    coverter:run()
  end
