--[[
  Function call arguments grammar.

  <func_args>:

    -+- "(" -+---------------+- ")" -+-
     |       +- <expr_list> -+       |
     +- <table> ---------------------+
     +- <string> --------------------+
]]

local handy = request('!.mechs.processor.handy')
local cho = handy.cho
local opt = handy.opt

local syntel = request('^.words.syntel')

local expr_list = request('^.wrappers.expr_list')
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
