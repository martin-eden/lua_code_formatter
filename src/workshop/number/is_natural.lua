-- Return true if argument is natural number

--[[
  Natural numbers sequence starts as 1, 2, 3, ...
  Note that we do not include 0.
  This sequence is also called "counting numbers".

  Zero is neutral element to addition. It's great as
  initialization value. In multiplication using zero creates
  more problems than it solves.
]]

-- Last mod.: 2024-11-03

return
  function(Number)
    assert_number(Number)

    if not is_integer(Number) then
      return false
    end

    if (Number <= 0) then
      return false
    end

    return true
  end

--[[
  2024-11-03
]]
