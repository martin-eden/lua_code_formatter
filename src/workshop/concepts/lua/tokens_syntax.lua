-- Grammar to parse Lua code to typed tokens list

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

local delim = request('tokens_syntax.delim')
local string = request('tokens_syntax.string')
local number = request('tokens_syntax.number')
local name = request('tokens_syntax.name')
local syntel = request('tokens_syntax.syntel')

local handy = request('!.mechs.processor.handy')
local opt_rep = handy.opt_rep
local cho = handy.cho

return
  {
    delim,
    opt_rep(
      cho(
        { name = 'string', string },
        { name = 'number', number },
        { name = 'name', name },
        { name = 'syntel', syntel }
      ),
      delim
    ),
  }

--[[
  2026-10-26
]]
