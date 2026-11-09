-- Function body grammar (params and statements)

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
               function_params
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ─ ( ─┬─────────────────────────────────┬─ ) ─ statements ─ word(end) ─
       ├─ named_vararg ──────────────────┤
       └─ names ─┬────────────────────┬──┘
                 └─ , ─ named_vararg ─┘
]]

local handy = request('!.mechs.processor.handy')
local opt = handy.opt
local cho = handy.cho

local name = request('^.words.name')
local named_vararg = { name = 'named_vararg', '...', opt(name) }
local names = request('^.wrappers.name_list')

return
  {
    {
      name = 'function_params',
      '(',
      opt(
        cho(
          named_vararg,
          { names, opt(',', named_vararg) }
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
  2026 #
  2026-10-28
]]
