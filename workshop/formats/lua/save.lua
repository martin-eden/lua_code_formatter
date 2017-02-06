local run_formatter = request('compile.formatter')

return
  function(data_struc, options)
    return run_formatter(data_struc, options)
  end
