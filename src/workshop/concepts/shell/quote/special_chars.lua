-- Context-free non-ordinary characters in shell

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
]]

--[[
  Punctuation chars that are not considered special in this scope:

    # % + - . , / : = ? @ _ ~
]]

local special_chars
do
  local ascii_chars = request('!.concepts.ascii.chars')
  local space_chars = request('space_chars')
  local add_list = request('!.concepts.list.add_list')

  special_chars =
    {
      ascii_chars.single_quote,
      ascii_chars.double_quote,
      ascii_chars.bang,
      ascii_chars.dollar_sign,
      ascii_chars.ampersand,
      ascii_chars.asterisk,
      ascii_chars.semicolon,
      ascii_chars.backslash,
      ascii_chars.caret,
      ascii_chars.backtick,
      ascii_chars.pipe,
      ascii_chars.less_than,
      ascii_chars.greater_than,
      ascii_chars.opening_paren,
      ascii_chars.closing_paren,
      ascii_chars.opening_bracket,
      ascii_chars.closing_bracket,
      ascii_chars.opening_brace,
      ascii_chars.closing_brace,
    }

  add_list(special_chars, space_chars)
end

return special_chars

--[[
  2026 # # #
]]
