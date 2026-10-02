-- Convert lines to string

--[[
  Author: Martin Eden
  Last mod.: 2026-08-08
]]

local list_to_string
local newline
do
  list_to_string = request('!.concepts.list.to_string')
  local AsciiChars = request('!.concepts.Ascii.Chars')
  newline = AsciiChars.newline
end

-- Concatenate strings list using newline separator. Tailing newline.
local lines_to_str =
  function(Lines)
    return list_to_string(Lines, newline) .. newline
  end

-- Export:
return lines_to_str

--[[
  2024 #
  2026-04 #
  2026-05-04
]]
