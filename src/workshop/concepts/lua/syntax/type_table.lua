-- Table definition grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-10-26
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

local KeyVal
do
  local bracket_expr = request('wrappers.bracket_expr')
  local name = request('words.name')

  KeyVal =
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

local RecDelim = { cho(',', ';') }

return
  {
    name = 'table',
    '{',
    opt(
      list(KeyVal, RecDelim),
      opt(RecDelim)
    ),
    '}',
  }

--[[
  2016 # #
  2018 # #
  2026-10-25
]]
