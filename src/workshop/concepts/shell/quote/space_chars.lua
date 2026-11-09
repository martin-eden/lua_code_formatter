-- Whitespace characters in shell

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  Whitespaces are context-free special characters

  Also they are used to apply special meaning to
  context-dependent "#" comment character:

    If the first non-space character in string is "#" then
    next characters till newline is comment.

    So " # c <nl>b" is comment " c " and token "b".
]]

--[[
  Because whitespaces serve several roles they live in separate
  module.
]]

local ascii_chars = request('!.concepts.ascii.chars')
return
  {
    ascii_chars.tab,
    ascii_chars.space,
    ascii_chars.newline,
  }

--[[
  2026-06-09
]]
