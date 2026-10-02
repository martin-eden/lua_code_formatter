-- Grammar to parse Lua code to typed tokens list

--[[
  Author: Martin Eden
  Last mod.: 2026-10-26
]]

local Delim = request('TokensSyntax.Delim')
local String = request('TokensSyntax.String')
local Number = request('TokensSyntax.Number')
local Name = request('TokensSyntax.Name')
local Syntel = request('TokensSyntax.Syntel')

local handy = request('!.mechs.processor.handy')
local opt_rep = handy.opt_rep
local cho = handy.cho

return
  {
    Delim,
    opt_rep(
      cho(
        { name = 'string', String },
        { name = 'number', Number },
        { name = 'name', Name },
        { name = 'syntel', Syntel }
      ),
      Delim
    ),
  }

--[[
  2026-10-26
]]
