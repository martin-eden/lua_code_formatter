local handy = request('!.mechs.processor.handy')
local opt = handy.opt
local opt_rep = handy.opt_rep

local syntel = request('^.words.syntel')
local expr_list = request('^.wrappers.expr_list')
local var_or_call = request('^.qualifiers.var_or_call')

return
  {
    name = 'assign_or_call',
    var_or_call,
    opt(
      opt_rep(syntel(','), var_or_call),
      syntel('='),
      expr_list
    ),
  }
