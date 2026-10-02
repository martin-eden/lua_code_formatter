-- Function body grammar (params and statements)

--[[
  Author: Martin Eden
  Last mod.: 2026-10-28
]]

--[[
               function_params
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ─ ( ─┬───────────────────────────────────┬─ ) ─ statements ─ word(end) ─
       ├─ NamedVararg ─────────────────────┤
       └─ NameList ─┬───────────────────┬──┘
                    └─ , ─ NamedVararg ─┘
]]

local handy = request('!.mechs.processor.handy')
local opt = handy.opt
local cho = handy.cho

local Name = request('^.words.name')
local NamedVararg = { name = 'named_vararg', '...', opt(Name) }
local NameList = request('^.wrappers.name_list')

return
  {
    {
      name = 'function_params',
      '(',
      opt(
        cho(
          NamedVararg,
          { NameList, opt(',', NamedVararg) }
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
