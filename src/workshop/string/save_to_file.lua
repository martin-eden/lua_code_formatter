local safe_open = request('!.file.safe_open')

return
  function(f_out_name, s)
    assert_string(s)
    local f_out = safe_open(f_out_name, 'wb')
    f_out:write(s)
    f_out:close()
  end
