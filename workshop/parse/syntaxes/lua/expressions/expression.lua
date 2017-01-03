local parser = request('^.^.^.parser')
local handy = parser.handy

local word = request('^.words.word')

local opt_spc = request('^.words.opt_spc')

local un_op =
  {
    name = 'un_op',
    handy.cho1(
      '-',
      '#',
      '~',
      word('not')
    ),
  }

local bin_op =
  {
    name = 'bin_op',
    handy.cho1(
      '+',
      '-',
      '*',
      '//',
      '/',
      '^',
      '%',
      '==',
      '~=',
      '&',
      '~',
      '|',
      '<<',
      '<=',
      '<',
      '>>',
      '>=',
      '>',
      '..',
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
    handy.opt(handy.list(un_op, opt_spc)),
    opt_spc,
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
      opt_spc, bin_op,
      opt_spc, '>expression'
    )
  }
