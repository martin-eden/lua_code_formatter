local spawn_match_function =
  function(pattern)
    assert_string(pattern)
    assert(pattern ~= '')
    -- Place "begin-of-text" anchor:
    if (pattern:sub(1, 1) ~= '^') then
      pattern = '^' .. pattern
    end
    return
      function(stream)
        return stream:match_regexp(pattern)
      end
  end

local any_char =
  function(stream)
    return stream:block_read(1)
  end

return
  {
    match_regexp = spawn_match_function,
    any_char = any_char,
  }
