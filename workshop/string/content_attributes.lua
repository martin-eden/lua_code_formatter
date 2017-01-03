local has_control_chars =
  function(s)
    local result = false
    if s:find('%c') then
      result = true
    end
    return result
  end

local has_backslashes =
  function(s)
    local result = false
    if s:find([[%\]]) then
      result = true
    end
    return result
  end

local has_single_quotes =
  function(s)
    local result = false
    if s:find([[%']]) then
      result = true
    end
    return result
  end

local has_double_quotes =
  function(s)
    local result = false
    if s:find([[%"]]) then
      result = true
    end
    return result
  end

return
  {
    has_control_chars = has_control_chars,
    has_backslashes = has_backslashes,
    has_single_quotes = has_single_quotes,
    has_double_quotes = has_double_quotes,
  }
