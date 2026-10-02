-- Context-free non-ordinary characters in shell

--[[
  Author: Martin Eden
  Last mod.: 2026-09-01
]]

local SpecialChars
do
  local Ascii = request('!.concepts.Ascii.Chars')
  local SpaceChars = request('SpaceChars')
  local add_list = request('!.concepts.list.add_list')

  SpecialChars =
    {
      Ascii.single_quote,
      Ascii.double_quote,
      Ascii.bang,
      Ascii.dollar_sign,
      Ascii.ampersand,
      Ascii.asterisk,
      Ascii.semicolon,
      Ascii.backslash,
      Ascii.caret,
      Ascii.backtick,
      Ascii.pipe,
      Ascii.less_than,
      Ascii.greater_than,
      Ascii.opening_paren,
      Ascii.closing_paren,
      Ascii.opening_bracket,
      Ascii.closing_bracket,
      Ascii.opening_brace,
      Ascii.closing_brace,
    }

  --[[
    Punctuation chars that are not considered special in this scope:

      # % + - . , / : = ? @ _ ~
  ]]

  add_list(SpecialChars, SpaceChars)
end

return SpecialChars

--[[
  2026 # # #
]]
