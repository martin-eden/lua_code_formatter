-- Check for directory presence

--[[
  Author: Martin Eden
  Last mod.: 2026-09-10
]]

local get_cmd_dir_exists = request('!.mechs.cmdline.get_cmd_dir_exists')

-- Export:
return
  function(dir_name)
    return (get_cmd_dir_exists(dir_name):Execute())
  end

--[[
  2024 #
  2026 # #
]]
