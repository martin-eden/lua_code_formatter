local represent_time = request('^.number.represent_time')

local cur_time = os.clock()
local last_time = os.clock()

return
  function(s)
    cur_time = os.clock()
    io.write(('[%s] %s\n'):format(represent_time(cur_time - last_time), s))
    last_time = cur_time
  end
