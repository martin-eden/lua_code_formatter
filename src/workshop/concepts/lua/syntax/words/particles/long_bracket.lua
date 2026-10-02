--[[
  Long brackets grammar.

  - "[" -+-----------+- "[" -+----------------+- "]" - <chunk> - "]" -
         | --------- |       | -------------- |
         | V       / |       | V            / |
         +--- "=" ---+       +--- any_char ---+
         ~~~~~~~~~~~~~
           :<chunk>

  Used in comments and strings.
]]

local match_regexp = request('!.mechs.parser.handy').match_regexp

return match_regexp('%[(%=*)%[.-%]%1%]')
