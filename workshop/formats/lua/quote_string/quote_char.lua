return
  function(c)
    --this is going to be called as gsub()'s function, so no arg checks
    return ([[\%03d]]):format(c:byte(1, 1))
  end
