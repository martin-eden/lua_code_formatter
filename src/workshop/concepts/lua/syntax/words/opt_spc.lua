-- Grammar for tokens delimiter

--[[
  Author: Martin Eden
  Last mod.: 2026-10-20
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

local handy = request('!.mechs.processor.handy')
local opt_rep = handy.opt_rep
local cho = handy.cho
local match_regexp = request('!.mechs.parser.handy').match_regexp
local long_bracket = request('particles.long_bracket')

local Comment =
  {
    '--',
    cho(
      long_bracket,
      match_regexp('[^\n\r]*')
    )
  }

return
  {
    opt_rep(
      cho(
        match_regexp('[ \t\n\r]+'),
        Comment
      )
    )
  }

--[[
  2016 #
  2018 #
  2026-10-20
]]
