local safe_open = request('safe_open')

return
  function(file_name)
    local f = safe_open(file_name, 'rb')
    local result = f:read('a')
    f:close()
    return result
  end
