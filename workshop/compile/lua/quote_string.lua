local quote_linear = request('quote_string.linear')
local quote_intact = request('quote_string.intact')

local content_funcs = request('^.^.string.content_attributes')
local has_control_chars = content_funcs.has_control_chars
local has_backslashes = content_funcs.has_backslashes
local has_single_quotes = content_funcs.has_single_quotes
local has_double_quotes = content_funcs.has_double_quotes

return
  function(s)
    assert_string(s)
    local quote_func
    if has_control_chars(s) then
      quote_func = quote_linear
    elseif
      has_backslashes(s) or
      (
        has_single_quotes(s) and
        has_double_quotes(s)
      )
    then
      quote_func = quote_intact
    else
      quote_func = quote_linear
    end
    local result = quote_func(s)
    return result
  end
