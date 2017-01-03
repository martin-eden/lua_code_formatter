local run_formatter = request('^.compile.lua.formatter')

return
  function(data_struc)
    return run_formatter(data_struc)
  end
