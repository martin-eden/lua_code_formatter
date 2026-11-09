-- Return true if argument is natural number

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  Natural numbers sequence starts as 1, 2, 3, ...
  Note that we do not include 0.
  This sequence is also called "counting numbers".
]]

return
  function(number)
    assert_number(number)

    if not (is_integer(number) and (number >= 1)) then
      return false
    end

    return true
  end

--[[
  2024 #
]]
