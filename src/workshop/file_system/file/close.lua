-- Close file object

--[[
  Author: Martin Eden
  Last mod.: 2026-09-14
]]

local io_type = io.type

-- Export:
return
  function(File)
    local file_type = io_type(File)

    if not is_string(file_type) then return end
    if (file_type == 'closed file') then return end

    File:close()
  end

--[[
  2024 #
  2026 #
]]
