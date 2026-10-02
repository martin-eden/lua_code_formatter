-- Expression grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

--[[
  <expression>

    ─┬─────────────┬─┬─ ... ─────────┬─┬───────────────────────────┬─
     │ ┌─────────┐ │ ├─ nil ─────────┤ │ ┌───────────────────────┐ │
     │ ▼         │ │ ├─ boolean ─────┤ │ ▼                       │ │
     └─── un_op ─┴─┘ ├─ number ──────┤ └─── bin_op ─ expression ─┴─┘
                     ├─ string ──────┤
                     ├─ table ───────┤
                     ├─ function ────┤
                     └─ var_or_call ─┘
]]

local handy = request('!.mechs.processor.handy')
local opt_rep = handy.opt_rep
local cho = handy.cho

local vararg = request('words.vararg')
local type_nil = request('type_nil')
local type_boolean = request('type_boolean')
local type_number = request('type_number')
local type_string = request('type_string')
local type_table = request('type_table')
local type_function = request('type_function')
local var_or_call = request('qualifiers.var_or_call')

local opt_spc = request('words.opt_spc')

local match_regexp = request('!.mechs.parser.handy').match_regexp
local word = request('words.word')

local UnaryOperator =
  {
    name = 'un_op',
    cho(
      match_regexp('[%-%#%~]'),
      word('not')
    ),
  }

-- Longer items should come before shorter items with same prefix
local BinaryOperator =
  {
    name = 'bin_op',
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

return
  {
    name = 'expression',
    inner_name = 'expression',
    opt_rep(opt_spc, UnaryOperator),
    opt_spc,
    cho(
      vararg,
      type_nil,
      type_boolean,
      type_number,
      type_string,
      type_table,
      type_function,
      var_or_call
    ),
    opt_rep(opt_spc, BinaryOperator, '>expression')
  }

--[[
  2016 #
  2017 # #
  2018 # # # # #
  2026-10-22
  2026-10-23
]]
