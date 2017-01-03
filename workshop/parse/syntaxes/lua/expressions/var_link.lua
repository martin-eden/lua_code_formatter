local parser = request('^.^.^.parser')
local handy = parser.handy

local name = request('^.words.name')
local opt_spc = request('^.words.opt_spc')

local expr_list = request('expr_list')
local type_table = request('^.type_table')
local type_string = request('^.type_string')

local func_args =
  {
    name = 'func_args',
    handy.cho1(
      {
        '(',
        opt_spc, handy.opt(expr_list),
        opt_spc, ')',
      },
      type_table,
      type_string
    ),
  }

local par_expr =
  {
    name = 'par_expr',
    '(',
    opt_spc, '>expression',
    opt_spc, ')',
  }

local dot_name =
  {
    name = 'dot_name',
    '.',
    opt_spc, name
  }

local colon_name =
  {
    name = 'colon_name',
    ':',
    opt_spc, name,
  }

local bracket_expr = request('bracket_expr')

return
  {
    name = 'var_link',
    handy.cho1(
      name,
      par_expr
    ),
    handy.opt_rep(
      opt_spc,
      handy.cho1(
        dot_name,
        bracket_expr,
        {
          colon_name,
          opt_spc, func_args,
        },
        func_args
      )
    ),
  }
