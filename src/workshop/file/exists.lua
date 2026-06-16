return
  function(file_name)
    local file_handle = io.open(file_name, 'r')
    local result = (file_handle ~= nil)
    if result then
      io.close(file_handle)
    end
    return result
  end
