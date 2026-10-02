-- String grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-10-25
]]

--[[
  <string>

    ─┬─ long_bracket ────────────────────┬─
     │     ┌───────────────────────┐     │
     │     ▼                       │     │
     ├─ " ───┬───────────────────┬─┴─ " ─┤
     │       ├─ \ any_char ──────┤       │
     │       └─ almost_any_char ─┘       │
     │     ┌───────────────────────┐     │
     │     ▼                       │     │
     └─ ' ───┬───────────────────┬─┴─ ' ─┘
             ├─ \ any_char ──────┤
             └─ almost_any_char ─┘
]]

local handy = request('!.mechs.processor.handy')
local opt_rep = handy.opt_rep
local cho = handy.cho
local match_regexp = request('!.mechs.parser.handy').match_regexp
local LongBrackets = request('Particles.LongBrackets')

return
  {
    cho(
      LongBrackets,
      {
        '"',
        opt_rep(
          cho(
            match_regexp([[[^%\%"]+]]),
            match_regexp([[%\.]])
          )
        ),
        '"'
      },
      {
        "'",
        opt_rep(
          cho(
            match_regexp([[[^%\%']+]]),
            match_regexp([[%\.]])
          )
        ),
        "'"
      }
    ),
  }

--[[
  2016 #
  2017 #
  2018 #
  2026-10-26
]]
