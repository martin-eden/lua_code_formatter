--[[
  Quote given string as by substituting all characters to their
  hex values.

  Handy for representing binary numbers:
    '\xB2\x7F\x02\xEE' has more sense than '²\x7F\x02î'
]]

local quote_char = request('quote_char')

return
  function(s)
    assert_string(s)
    return "'" .. s:gsub('.', quote_char) .. "'"
  end
