local long_quote_pattern = request('^.^.long_quote_pattern').start

return
  function(s)
    assert_string(s)

    local used_quote_lengths --lazy initialization
    for capture in s:gmatch(long_quote_pattern) do
      used_quote_lengths = used_quote_lengths or {}
      used_quote_lengths[#capture] = true
    end
    if (s:sub(-1, -1) == ']') then
      -- case "abc]". We do not want "[[abc]]]"
      used_quote_lengths = used_quote_lengths or {}
      used_quote_lengths[0] = true
    end

    local min_needed_quote = 0
    if used_quote_lengths then
      while used_quote_lengths[min_needed_quote] do
        min_needed_quote = min_needed_quote + 1
      end
    end

    local quote_chunk = ('='):rep(min_needed_quote)
    return ('[%s[%s]%s]'):format(quote_chunk, s, quote_chunk)
  end
