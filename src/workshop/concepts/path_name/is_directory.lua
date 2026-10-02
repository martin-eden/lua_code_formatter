-- Return true if pathname denotes directory

--[[
  Author: Martin Eden
  Last mod.: 2026-08-29
]]

local self_dir
local upper_dir
do
  local Syntels = request('Syntels')
  self_dir = Syntels.self_dir
  upper_dir = Syntels.upper_dir
end

-- Export:
return
  function(Pathname)
    local last_node = Pathname[#Pathname]

    return
      (last_node == '') or
      (last_node == self_dir) or
      (last_node == upper_dir)
  end

--[[
  2026 # #
]]
