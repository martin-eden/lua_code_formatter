local handy = request('!.mechs.processor.handy')
local list = handy.list

local var_ref = request('^.expressions.var_ref')
local syntel = request('^.words.syntel')
local expr_list = request('^.expressions.expr_list')

return
  {
    name = 'assignment',
    list(var_ref, syntel(',')),
    syntel('='),
    expr_list
  }
