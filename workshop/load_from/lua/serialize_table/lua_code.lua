return
  function(s)
    local f = load(s)
    local result
    if f then
      result = f()
    end
    return result
  end
