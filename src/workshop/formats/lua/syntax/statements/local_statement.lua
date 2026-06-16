local handy = request('!.mechs.processor.handy')
local opt = handy.opt
local cho = handy.cho

local word = request('^.words.word')
local syntel = request('^.words.syntel')
local name_list = request('^.wrappers.name_list')
local expr_list = request('^.wrappers.expr_list')
local named_function = request('named_function')

return
  {
    name = 'local_statement',
    word('local'),
    cho(
      {
        name = 'local_assignment',
        name_list,
        opt(
          syntel('='),
          expr_list
        )
      },
      named_function
    ),
  }
