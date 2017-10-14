--[[
  Action-call of [generic_file_converter].
]]

local c_converter = request('!.mechs.generic_file_converter.interface')

return
  function(params)
    local coverter = new(c_converter, params)
    coverter:init()
    coverter:run()
  end
