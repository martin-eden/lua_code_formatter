local handy = request('!.mechs.processor.handy')
local match_regexp = request('!.mechs.parser.handy').match_regexp

local word = request('^.words.word')

local opt_spc = request('^.words.opt_spc')

local un_op =
  {
    name = 'un_op',
    handy.cho(
      {opt_spc, match_regexp('[%-%#%~]')},
      word('not')
    ),
  }

local bin_op =
  {
    name = 'bin_op',
    opt_spc,
    handy.cho(
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
local var_link = request('var_link')

return
  {
    name = 'expression',
    inner_name = 'expression',
    handy.opt_rep(un_op),
    handy.cho(
      vararg,
      type_nil,
      type_boolean,
      type_number,
      type_string,
      type_table,
      type_function,
      var_link
    ),
    handy.opt_rep(
      bin_op,
      '>expression'
    )
  }
