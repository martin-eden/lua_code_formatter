local handy = request('!.mechs.processor.handy')

local word = request('^.words.word')
local opt_spc = request('^.words.opt_spc')
local name_list = request('^.words.name_list')
local expr_list = request('^.expressions.expr_list')
local named_function = request('named_function')

return
  {
    name = 'local_statement',
    word('local'),
    handy.cho(
      {
        name = 'local_assignment',
        name_list,
        handy.opt(
          opt_spc, '=',
          expr_list
        )
      },
      named_function
    ),
  }
