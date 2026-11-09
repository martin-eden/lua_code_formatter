-- Constrain given number between min and max values

--[[
  Author: Martin Eden
  Last mod.: 2026-11-11
]]

return
  function(num, min, max)
    if (num < min) then
      return min
    end

    if (num > max) then
      return max
    end

    return num
  end

--[[
  2020 #
]]
