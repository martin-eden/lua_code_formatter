-- Return file's contents as string

--[[
  Author: Martin Eden
  Last mod.: 2026-11-16
]]

local open_file = request('open')
local close_file = request('close')

return
  function(pathname)
    local file = open_file(pathname, 'rb')
    local result = file:read('a')
    close_file(file)
    return result
  end

--[[
  2016 # #
  2019 #
  2026 # #
]]
