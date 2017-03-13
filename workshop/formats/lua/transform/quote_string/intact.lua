return
  function(s)
    assert_string(s)

    local min_needed_quotes = 0

    if (s:sub(-1) == ']') then
      -- case "abc]". We do not want "[[abc]]]"
      min_needed_quotes = 1
    end

    local postfix, eq_chunk
    while true do
      eq_chunk = ('='):rep(min_needed_quotes)
      postfix = ']' .. eq_chunk .. ']'
      if not s:find(postfix, 1, true) then
        break
      end
      min_needed_quotes = min_needed_quotes + 1
    end

    local prefix = '[' .. eq_chunk .. '['

    -- Handling special case: heading newline dropped in long strings.
    if
      (s:sub(1, 2) == '\x0d\x0a') or
      (s:sub(1, 1) == '\x0a')
    then
      prefix = prefix .. '\n'
    end

    return prefix .. s .. postfix
  end
