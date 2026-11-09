-- Return true if pathname denotes directory

--[[
  Author: Martin Eden
  Last mod.: 2026-11-11
]]

local self_dir
local upper_dir
do
  local syntels = request('syntels')
  self_dir = syntels.self_dir
  upper_dir = syntels.upper_dir
end

return
  function(pathname)
    local last_node = pathname[#pathname]

    return
      (last_node == '') or
      (last_node == self_dir) or
      (last_node == upper_dir)
  end

--[[
  2026 # #
]]
