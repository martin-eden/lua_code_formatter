-- Return shell command to check that pathname is existing directory

--[[
  Author: Martin Eden
  Last mod.: 2026-11-11
]]

local normalize = request('!.concepts.path_name.normalize')
local shell_command = request('!.concepts.shell_command')

return
  function(pathname)
    local command = { 'test', '-d', normalize(pathname) }

    return shell_command.create(command)
  end

--[[
  2026 #
]]
