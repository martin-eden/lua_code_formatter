local bs = [[\]]
local one_char_seq_subst =
  {
    [bs .. 'a'] = '\007',
    [bs .. 'b'] = '\008',
    [bs .. 'f'] = '\x0c',
    [bs .. 'n'] = '\x0a',
    [bs .. 'r'] = '\x0d',
    [bs .. 't'] = '\x09',
    [bs .. 'v'] = '\x0b',
    [bs .. '"'] = '"',
    [bs .. "'"] = "'",
    [bs .. '\n'] = '\n',
  }

local space_char = '[\x00-\x20]'
local space_chars_seq = ([[\z%s*]]):format(space_char)

local dec_dig = '[0-9]'
local dec_code_seq = ([[\(%s%s?%s?)]]):format(dec_dig, dec_dig, dec_dig)
local decode_dec_code =
  function(code_str)
    local dec_code = tonumber(code_str)
    local result
    -- dec_code is 0..999 by pattern design
    if (dec_code <= 255) then
      result = string.char(dec_code)
    else
      -- Hmm, it's invalid escape sequence. Do not change in this case.
    end
    return result
  end

local hex_dig = '[0-9A-Fa-f]'
local hex_code_seq = ([[\x(%s%s)]]):format(hex_dig, hex_dig)
local decode_hex_code =
  function(code_str)
    local dec_code = tonumber(code_str, 16)
    -- dec_code is 0..255 by pattern design as it's from 2 hex digits
    return string.char(dec_code)
  end

local utf_code_seq = ([[\u{(%s+)}]]):format('hex_dig')
local decode_utf_code =
  function(code_str)
    local result
    if (#code_str > 6) then
      -- bad code sequence
    else
      local dec_code = tonumber(code_str, 16)
      if (dec_code > 0x1FFFFF) then
        -- bad code sequence also
      else
        result = utf8.char(dec_code)
      end
    end
    return result
  end

return
  function(s)
    s = s:gsub(bs .. '.', one_char_seq_subst)

    s = s:gsub(space_chars_seq, '')

    s = s:gsub(dec_code_seq, decode_dec_code)
    s = s:gsub(hex_code_seq, decode_hex_code)
    s = s:gsub(utf_code_seq, decode_utf_code)

    s = s:gsub([[\\]], bs)
    return s
  end
