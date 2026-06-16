return
  function(c)
    --this is going to be called as gsub()'s function, so no arg checks
    return ([[\x%02X]]):format(c:byte(1, 1))
  end
