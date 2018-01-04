local handy = request('!.mechs.processor.handy')
local cho = handy.cho
local opt = handy.opt

local expr_list = request('expr_list')
local syntel = request('^.words.syntel')
local type_table = request('^.type_table')
local type_string = request('^.type_string')

return
  {
    name = 'func_args',
    cho(
      {
        syntel('('),
        opt(expr_list),
        syntel(')'),
      },
      type_table,
      type_string
    ),
  }
