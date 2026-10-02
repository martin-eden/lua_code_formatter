-- Create directory if it does not exist

--[[
  Author: Martin Eden
  Last mod.: 2026-09-14
]]

local directory_exists = request('exists')
local get_mkdir_command = request('!.mechs.cmdline.get_cmd_mkdir')

--[[
  Returns true if directory is present before or after execution.
]]

-- Export:
return
  function(dir_name)
    assert_string(dir_name)

    if directory_exists(dir_name) then return true end

    get_mkdir_command(dir_name):Execute()

    if directory_exists(dir_name) then return true end

    return false
  end

--[[
  2024 #
  2026 #
]]
