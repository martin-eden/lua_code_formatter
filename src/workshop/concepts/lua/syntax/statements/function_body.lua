-- Function body grammar (params and statements)

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

--[[
               function_params
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ─ ( ─┬───────────────────────────────┬─ ) ─ statements ─ word(end) ─
       ├─ vararg ──────────────────────┤
       └─ name_list ─┬──────────────┬──┘
                     └─ , ─ vararg ─┘
]]

local handy = request('!.mechs.processor.handy')
local opt = handy.opt
local cho = handy.cho

local vararg = request('^.words.vararg')
local name_list = request('^.wrappers.name_list')
local syntel = request('^.words.syntel')
local word = request('^.words.word')

return
  {
    {
      name = 'function_params',
      syntel('('),
      opt(
        cho(
          vararg,
          { name_list, opt(syntel(','), vararg) }
        )
      ),
      syntel(')'),
    },
    '>statements',
    word('end'),
  }

--[[
  2016 # #
  2018 #
]]
