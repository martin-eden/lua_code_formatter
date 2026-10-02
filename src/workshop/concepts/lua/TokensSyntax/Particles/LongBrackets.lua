-- Long brackets grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-10-26
]]

--[[
  Long brackets grammar

    ─ [ ─┬─────────┬─ [ ─┬─────────────────┬─ ] ─ chunk ─ ] ─
         │ ┌─────┐ │     │ ┌─────────────┐ │
         │ ▼     │ │     │ ▼             │ │
         └─── = ─┴─┘     └── <any_char> ─┴─┘
         ~~~~~~~~~~~
            chunk

  Used in comments and strings.
]]

local match_regexp = request('!.mechs.parser.handy').match_regexp

return match_regexp('%[(%=*)%[.-%]%1%]')

--[[
  2016 #
  2018 #
  2026-10-26
]]
