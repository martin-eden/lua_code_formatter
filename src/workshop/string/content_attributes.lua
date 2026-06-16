local has_control_chars =
  function(s)
    return s:find('%c') and true
  end

local has_backslashes =
  function(s)
    return s:find([[%\]]) and true
  end

local has_single_quotes =
  function(s)
    return s:find([[%']]) and true
  end

local has_double_quotes =
  function(s)
    return s:find([[%"]]) and true
  end

local is_nonascii =
  function(s)
    return s:find('[^%w%s_%p]')
  end

return
  {
    has_control_chars = has_control_chars,
    has_backslashes = has_backslashes,
    has_single_quotes = has_single_quotes,
    has_double_quotes = has_double_quotes,
    is_nonascii = is_nonascii,
  }
