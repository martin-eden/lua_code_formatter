-- Expression grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-10-27
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

local Vararg = request('words.vararg')
local Type_Table = request('type_table')
local Type_Function
do
  local function_body = request('statements.function_body')
  Type_Function = { name = 'type_function', 'function', function_body }
end
local RefOrCall = request('qualifiers.var_or_call')

local UnaryOperator =
  { name = 'un_op', cho('-', '#', '~', 'not') }

local BinaryOperator =
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

local TokensAccessor = request('!.concepts.lua.TokensAccessor')

local Type_Nil = { name = 'nil', 'nil' }
local Type_Boolean = { name = 'boolean', cho('false', 'true') }
local Type_Number = { name = 'number', TokensAccessor.IsNumber }
local Type_String = request('type_string')

return
  {
    name = 'expression',
    inner_name = 'expression',
    opt_rep(UnaryOperator),
    cho(
      RefOrCall,
      Vararg,
      Type_Nil,
      Type_Boolean,
      Type_Number,
      Type_String,
      Type_Table,
      Type_Function
    ),
    opt_rep(BinaryOperator, '>expression')
  }

--[[
  2016 #
  2017 # #
  2018 # # # # #
  2026 #
  2026-10-25
]]
