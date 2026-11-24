-- Function body grammar (params and statements)

--[[
  Author: Martin Eden
  Last mod.: 2026-11-24
]]

--[[
               function_params
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ─ ( ─┬─────────────────────────────────┬─ ) ─ statements ─ word(end) ─
       ├─┬─ name ─┬─┬────────────────────┤
       │ ▲        │ └─ , ─ named_vararg ─┤
       │ └─ , ────┘                      │
       └─ named_vararg ──────────────────┘
]]

local handy = request('!.mechs.processor.handy')
local opt = handy.opt
local cho = handy.cho
local list = handy.list

local name = request('^.words.name')
local named_vararg = { name = 'named_vararg', '...', opt(name) }

return
  {
    {
      name = 'function_params',
      '(',
      opt(
        cho(
          { list(name, ','), opt(',', named_vararg) },
          named_vararg
        )
      ),
      ')',
    },
    '>statements',
    'end',
  }

--[[
  2016 # #
  2018 #
  2026 # #
  2026-11-24
]]
