--[[
  This code is used in postprocessing lua code data from [parser].
  So strings should be correct by grammar design.
  So no checks for correctness needed.

  We transform values in quoted strings to raw values by
  unescaping and removing quotes.
]]

local unquote_linear = request('unquote_string.linear')

local long_quote_start = '^%[=*%['
local long_quote_finish = '%]=*%]$'
local get_long_quote_len =
  function(s)
    local start_chunk = s:match(long_quote_start)
    local finish_chunk = s:match(long_quote_finish)
    local result
    if start_chunk and (#start_chunk == #finish_chunk) then
      result = #start_chunk
    end
    return result
  end

return
  function(s)
    local result

    local first_char = s:sub(1, 1)
    if (first_char == "'") or (first_char == '"') then
      result = s:sub(2, -2)
      result = unquote_linear(result)
    elseif (first_char == '[') then
      local quote_len = get_long_quote_len(s)
      if not quote_len then
        error(('String "%s" has bad long quotes?'):format(s), 2)
      end
      result = s:sub(quote_len + 1, -(quote_len + 1))
      -- Special case with long quotes. Heading newline is dropped.
      if (result:sub(1, 2) == '\x0d\x0a') then
        result = result:sub(3)
      elseif (result:sub(1, 1) == '\x0a') then
        result = result:sub(2)
      end
    end

    return result
  end
