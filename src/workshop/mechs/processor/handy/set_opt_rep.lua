return
  function(...)
    local result = {...}
    result.op = 'opt'
    result.f_rep = true
    return result
  end
