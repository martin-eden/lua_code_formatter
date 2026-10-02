local set_opt_rep = request('set_opt_rep')

return
  function(...)
    local body = {...}
    assert(#body >= 2)
    local delimiter = body[#body]
    body[#body] = nil
    return {body, set_opt_rep(delimiter, body)}
  end
