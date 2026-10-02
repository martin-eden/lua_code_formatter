-- Number literal grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-10-26
]]

--[[
  <Number>

    ─┬─ HexNumber ─┬─
     └─ DecNumber ─┘

  <HexNumber>

    ─ 0 ─┬─ x ─┬──┬─ . Int_16 ─────────────────────┬─ ...
         └─ X ─┘  └─ Int_16 ─┬──────────────────┬──┘
                             └─ . ─┬──────────┬─┘
                                   └─ Int_16 ─┘

      ─┬───────────────────────────┬───
       └─┬─ p ─┬─┬─────┬─ Int_10 ──┘
         └─ P ─┘ ├─ + ─┤
                 └─ - ─┘

  <DecNumber>

    ─┬─ . Int_10 ─────────────────────┬─ ...
     └─ Int_10 ─┬──────────────────┬──┘
                └─ . ─┬──────────┬─┘
                      └─ Int_10 ─┘

      ─┬───────────────────────────┬───
       └─┬─ e ─┬─┬─────┬─ Int_10 ──┘
         └─ E ─┘ ├─ + ─┤
                 └─ - ─┘
  Order

    <HexNumber> must be checked first. Or it's "0" from prefix "0x"
    will be treated as decimal <DecNumber> "0".
]]

local handy = request('!.mechs.processor.handy')
local opt = handy.opt
local cho = handy.cho
local match_regexp = request('!.mechs.parser.handy').match_regexp

local Int_16 = match_regexp('%x+')
local HexNumber =
  {
    match_regexp('0[xX]'),
    cho(
      { '.', Int_16 },
      { Int_16, opt('.', opt(Int_16)) }
    ),
    opt(match_regexp('[pP][%+%-]?%d+'))
  }

local Int_10 = match_regexp('%d+')
local DecNumber =
  {
    cho(
      { '.', Int_10 },
      { Int_10, opt('.', opt(Int_10)) }
    ),
    opt(match_regexp('[eE][%+%-]?%d+'))
  }

return cho(HexNumber, DecNumber)

--[[
  2016 #
  2017 #
  2018 #
  2026-10-26
]]
