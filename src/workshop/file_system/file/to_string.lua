-- Return file's contents as string

--[[
  Author: Martin Eden
  Last mod.: 2026-09-14
]]

local open_file = request('open')
local close_file = request('close')

-- Export:
return
  function(pathname)
    local File = open_file(pathname, 'rb')

    local result = File:read('a')

    close_file(File)

    return result
  end

--[[
  2016 # #
  2019 #
  2026 # #
]]
