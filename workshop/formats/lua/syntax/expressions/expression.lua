local handy = request('!.mechs.processor.handy')
local opt_rep = handy.opt_rep
local cho = handy.cho
local match_regexp = request('!.mechs.parser.handy').match_regexp

local word = request('^.words.word')

local opt_spc = request('^.words.opt_spc')

local un_op =
  {
    name = 'un_op',
    cho(
      {opt_spc, match_regexp('[%-%#%~]')},
      word('not')
    ),
  }

local bin_op =
  {
    name = 'bin_op',
    opt_spc,
    cho(
      '//',
      '==',
      '~=',
      '<<',
      '<=',
      '>>',
      '>=',
      '..',
      match_regexp('[%+%-%*%/%^%%%&%~%|%<%>]'),
      word('and'),
      word('or')
    ),
  }

local vararg = request('vararg')
local type_nil = request('^.type_nil')
local type_boolean = request('^.type_boolean')
local type_number = request('^.type_number')
local type_string = request('^.type_string')
local type_table = request('^.type_table')
local type_function = request('^.type_function')
local var_ref = request('var_ref')
local function_call = request('^.statements.function_call')

return
  {
    name = 'expression',
    inner_name = 'expression',
    opt_rep(un_op),
    cho(
      vararg,
      type_nil,
      type_boolean,
      type_number,
      type_string,
      type_table,
      type_function,
      var_ref,
      function_call
    ),
    opt_rep(
      bin_op,
      '>expression'
    )
  }
