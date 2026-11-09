-- Expression grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
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
                     └─ ref_or_call ─┘
]]

local handy = request('!.mechs.processor.handy')
local opt_rep = handy.opt_rep
local cho = handy.cho

local vararg = request('words.vararg')
local type_table = request('type_table')
local type_function
do
  local function_body = request('statements.function_body')
  type_function = { name = 'type_function', 'function', function_body }
end
local ref_or_call = request('qualifiers.var_or_call')

local unary_operator =
  { name = 'un_op', cho('-', '#', '~', 'not') }

local binary_operator =
  {
    name = 'bin_op',
    cho(
      '==',
      '~=',
      '<=',
      '<<',
      '<',
      '>=',
      '>>',
      '>',
      'and',
      'or',
      '..',
      '+',
      '-',
      '*',
      '//',
      '/',
      '%',
      '^',
      '&',
      '~',
      '|'
    ),
  }

local tokens_accessor = request('!.concepts.lua.tokens_accessor')

local type_nil = { name = 'nil', 'nil' }
local type_boolean = { name = 'boolean', cho('false', 'true') }
local type_number = { name = 'number', tokens_accessor.is_number }
local type_string = request('type_string')

return
  {
    name = 'expression',
    inner_name = 'expression',
    opt_rep(unary_operator),
    cho(
      ref_or_call,
      vararg,
      type_nil,
      type_boolean,
      type_number,
      type_string,
      type_table,
      type_function
    ),
    opt_rep(binary_operator, '>expression')
  }

--[[
  2016 #
  2017 # #
  2018 # # # # #
  2026 #
  2026-10-25
]]
