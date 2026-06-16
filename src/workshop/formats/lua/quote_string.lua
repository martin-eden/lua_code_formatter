local quote_escaped = request('quote_string.linear')
local quote_long = request('quote_string.intact')
local quote_dump = request('quote_string.dump')

local content_funcs = request('!.string.content_attributes')
local has_control_chars = content_funcs.has_control_chars
local has_backslashes = content_funcs.has_backslashes
local has_single_quotes = content_funcs.has_single_quotes
local has_double_quotes = content_funcs.has_double_quotes
local is_nonascii = content_funcs.is_nonascii

local binary_entities_lengths =
  {
    [1] = true,
    [2] = true,
    [4] = true,
    [6] = true,
    [8] = true,
    [10] = true,
    [16] = true,
  }

return
  function(s)
    assert_string(s)
    local quote_func
    if binary_entities_lengths[#s] and is_nonascii(s) then
      quote_func = quote_dump
    elseif has_control_chars(s) then
      quote_func = quote_escaped
    elseif
      has_backslashes(s) or
      (
        has_single_quotes(s) and
        has_double_quotes(s)
      )
    then
      quote_func = quote_long
    else
      quote_func = quote_escaped
    end
    local result = quote_func(s)
    return result
  end
