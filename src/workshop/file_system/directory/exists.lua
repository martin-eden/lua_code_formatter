-- Check for directory presence

--[[
  Author: Martin Eden
  Last mod.: 2026-11-11
]]

local get_cmd_dir_exists = request('!.mechs.cmdline.get_cmd_dir_exists')

return
  function(dir_name)
    return (get_cmd_dir_exists(dir_name):execute())
  end

--[[
  2024 #
  2026 # #
]]
