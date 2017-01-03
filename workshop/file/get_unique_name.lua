local file_exists = request('exists')

local max_num_tries = 10

return
  function()
    -- do return os.tmpname() end --(1)
    local result
    local num_tries = 0
    repeat
      result = ('%010d.tmp'):format(math.random(2 ^ 32))
      num_tries = num_tries + 1
      if (num_tries > max_num_tries) then
        error('Too many tries to generate file name. Possibly due same math.randomseed. Stopped.')
      end
    until not file_exists(result)
    return result
  end

--[[
  [1]
    os.tmpname() is not used because in my case /tmp is really
    partition in memory. So it does not solve problem when I have
    data structure occupuing 80% of RAM and write raw data to file
    which is 40% of RAM.
]]
