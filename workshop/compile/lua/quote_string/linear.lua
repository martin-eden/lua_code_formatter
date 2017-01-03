local quote_char = request('quote_char')
local custom_quotes = request('custom_quotes')

--[[
  [1]
    I do not want to remember <custom_quotes> mapping (to understand
    that "\f" in output means ASCII code 0x0C. Also I do not like when
    "\" maps to "\\", I prefer "\x5c". Without using <custom_quote>
    table you get longer but easier to understand data representation.
]]
return
  function(s)
    local result = s
    --(1)
    -- result = result:gsub([[\]], custom_quotes['\\'])
    result = result:gsub([[\]], quote_char)
    -- result = result:gsub('[%c]', custom_quotes)
    result = result:gsub('[%c]', quote_char)
    --/

    local cnt_q1 = 0
    for i in result:gmatch("'") do
      cnt_q1 = cnt_q1 + 1
    end
    local cnt_q2 = 0
    for i in result:gmatch('"') do
      cnt_q2 = cnt_q2 + 1
    end
    if (cnt_q1 <= cnt_q2) then
      result = "'" .. result:gsub("'", custom_quotes["'"]) .. "'"
    else
      result = '"' .. result:gsub('"', custom_quotes['"']) .. '"'
    end
    return result
  end
