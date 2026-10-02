-- Return shell command to check that pathname is existing directory

--[[
  Author: Martin Eden
  Last mod.: 2026-09-10
]]

local normalize = request('!.concepts.path_name.normalize')
local ShellCommand = request('!.concepts.ShellCommand')

-- Export:
return
  function(pathname)
    local Command = { 'test', { '-d', normalize(pathname) } }

    return ShellCommand.create(Command)
  end

--[[
  2026-09-10
]]
