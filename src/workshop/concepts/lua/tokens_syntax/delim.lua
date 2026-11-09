-- Grammar for tokens delimiter

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[==[
  In Lua delimiters are SPACE TAB NEWLINE RETURN and Comment

  There are two families of Comment

    * One-line comment

      > -- Like this one

    * Block comment

      > --[=[
      >       Like this one
      > --]=]

      > --[[
      >   More typical comment.
      > ]]
]==]

local long_brackets = request('particles.long_brackets')
local match_regexp = request('!.mechs.parser.handy').match_regexp
local handy = request('!.mechs.processor.handy')
local opt_rep = handy.opt_rep
local cho = handy.cho

local comment =
  { '--', cho(long_brackets, match_regexp('[^\n\r]*')) }

return
  { opt_rep(cho(match_regexp('[ \t\n\r]+'), comment)) }

--[[
  2016 #
  2018 #
  2026-10-26
]]
