-- Open file and return handle or throw an error

--[[
  Author: Martin Eden
  Last mod.: 2026-09-26
]]

local default_mode = 'rb'
local io_open = io.open

return
  function(pathname, mode)
    assert_string(pathname)

    mode = mode or default_mode

    local file, err_msg = io_open(pathname, mode)

    if not file then
      error(err_msg, 2)
    end

    return file
  end

--[[
  2016 #
  2017 #
  2026 #
  2026-09-26
]]
