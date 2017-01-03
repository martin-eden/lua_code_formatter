local parser = request('^.^.^.^.parser')
local handy = parser.handy
local match_pattern = handy.match_pattern

local long_quote_pattern = request('^.^.^.^.lua.long_quote_pattern')

return
  function(s, s_pos)
    local do_open_match = match_pattern(long_quote_pattern.start)
    local has_open_match, new_s_pos = do_open_match(s, s_pos)
    if has_open_match then
      local start_quote = s:sub(s_pos, new_s_pos - 1)
      local finish_quote = start_quote:gsub('%[', ']')
      local close_start, close_finish = s:find(finish_quote, new_s_pos, true)
      if close_finish then
        new_s_pos = close_finish + 1
        return true, new_s_pos
      end
    end
  end
