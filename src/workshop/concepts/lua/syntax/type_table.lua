-- Table definition grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  <table>

    ── { ─┬───────────────────────┬─ } ─
          │ ┌───────────────────┐ │
          │ ▼                   │ │
          └─── key_val ─┬─ , ─┬─┴─┤
                        ├─ ; ─┘   │
                        └─────────┘

  <key_val>

    ─┬────────────────────────┬─ expression ─
     └─┬─ bracket_expr ─┬─ = ─┘
       └─ name ─────────┘
]]

local handy = request('!.mechs.processor.handy')
local cho = handy.cho
local list = handy.list
local opt = handy.opt

local key_val
do
  local bracket_expr = request('wrappers.bracket_expr')
  local name = request('words.name')

  key_val =
    {
      name = 'key_val',
      opt(
        cho(
          bracket_expr,
          name
        ),
        '='
      ),
      '>expression',
    }
end

local rec_delim = { cho(',', ';') }

return
  {
    name = 'table',
    '{',
    opt(
      list(key_val, rec_delim),
      opt(rec_delim)
    ),
    '}',
  }

--[[
  2016 # #
  2018 # #
  2026-10-25
]]
