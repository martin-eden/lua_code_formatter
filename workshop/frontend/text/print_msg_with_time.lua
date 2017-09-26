local represent_time = request('!.number.represent_time')

local last_time

return
  function(s)
    local cur_time = os.clock()
    if last_time then
      local time_passed = represent_time(cur_time - last_time)
      io.stdout:write((' [%s]\n'):format(time_passed))
    end
    io.stdout:write(s)
    io.stdout:flush()
    last_time = cur_time
  end
