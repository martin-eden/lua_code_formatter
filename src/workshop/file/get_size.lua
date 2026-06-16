--[[
  Return file size in bytes.

  Syntax:

    <file_name> -> <file_size>
       string        integer
]]

local safe_open = request('safe_open')

return
  function(file_name)
    local f = safe_open(file_name, 'rb')
    local result = f:seek('end')
    f:close()
    return result
  end
