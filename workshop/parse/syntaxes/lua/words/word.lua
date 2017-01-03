local parser = request('^.^.^.parser')
local handy = parser.handy

local mid_letter = handy.match_pattern('[_A-Za-z0-9]')

return
  function(...)
    local result =
      {
        ...
      }
    result[#result + 1] = handy.is_not(mid_letter)
    return result
  end
