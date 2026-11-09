-- Return string with regexp to match any of regexp special character

--[[
  Author: Martin Eden
  Last mod.: 2026-11-15
]]

local defused_magic_chars_str
do
  local ascii = request('!.concepts.ascii.chars')
  local magic_chars =
    {
      ascii.caret,
      ascii.dollar_sign,
      ascii.percent,
      ascii.dot,
      ascii.question_mark,
      ascii.asterisk,
      ascii.plus,
      ascii.minus,
      ascii.opening_paren,
      ascii.closing_paren,
      ascii.opening_bracket,
      ascii.closing_bracket,
    }
  local list_to_str = request('!.concepts.list.to_string')
  local str_gsub = string.gsub
  defused_magic_chars_str =
    str_gsub(list_to_str(magic_chars), '.', '%%%0')
end
local to_charset = request('to_charset')

return to_charset(defused_magic_chars_str)

--[[
  2018 #
  2026 #
  2026-11-15
]]
