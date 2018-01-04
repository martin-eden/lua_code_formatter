local handy = request('!.mechs.processor.handy')
local opt = handy.opt
local cho = handy.cho

local vararg = request('^.expressions.vararg')
local name_list = request('^.words.name_list')
local word = request('^.words.word')
local statements = request('statements')
local syntel = request('^.words.syntel')

local params_list =
  cho(
    vararg,
    {
      name_list,
      opt(
        syntel(','),
        vararg
      ),
    }
  )

return
  {
    {
      name = 'function_params',
      syntel('('),
      opt(params_list),
      syntel(')'),
    },
    {
      statements,
      word('end'),
    }
  }
