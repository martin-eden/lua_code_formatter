-- Lua statements grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-10-30
]]

--[[
  <statements>

    ─┬─────────────────────────────┬─┬────────────────────┬─
     │ ┌─────────────────────────┐ │ └─ return_statement ─┘
     │ ▼                         │ │
     └───┬─────────────────────┬─┴─┘
         ├─ assign_or_call ────┤
         ├─ named_function ────┤
         ├─ empty_statement ───┤
         ├─ label_statement ───┤
         ├─ goto_statement ────┤
         ├─ local_statement ───┤
         ├─ global_statement ──┤
         ├─ break_statement ───┤
         ├─ do_block ──────────┤
         ├─ if_block ──────────┤
         ├─ while_block ───────┤
         ├─ repeat_block ──────┤
         ├─ generic_for_block ─┤
         └─ numeric_for_block ─┘
]]

local handy = request('!.mechs.processor.handy')
local opt = handy.opt
local opt_rep = handy.opt_rep
local cho = handy.cho

local AssignOrCall
do
  local RefOrCall = request('qualifiers.var_or_call')
  local expr_list = request('wrappers.expr_list')

  AssignOrCall =
    {
      name = 'assign_or_call',
      RefOrCall,
      opt(
        opt_rep(',', RefOrCall),
        '=',
        expr_list
      ),
    }
end

local NamedFunction = request('statements.named_function')

local Name = request('words.name')

local EmptyStatement = { name = 'empty_statement', ';' }
local LabelStatement = { name = 'label_statement', '::', Name, '::' }
local GotoStatement = { name = 'goto_statement', 'goto', Name }
local BreakStatement = { name = 'break_statement', 'break' }

local name_list = request('wrappers.name_list')
local expr_list = request('wrappers.expr_list')

local attribute = { name = 'attribute', '<', Name, '>' }

local attr_name_list
do
  local attr_name = { name = 'attr_name', Name, opt(attribute) }
  local list = request('!.mechs.processor.handy').list

  attr_name_list =
    {
      name = 'attr_name_list',
      opt(attribute),
      list(attr_name, ','),
    }
end

local LocalStatement =
  {
    name = 'local_statement',
    'local',
    cho(
      { name = 'local_assignment', attr_name_list, opt('=', expr_list) },
      NamedFunction
    ),
  }

local GlobalStatement =
  {
    name = 'global_statement',
    'global',
    cho(
      { attr_name_list, opt('=', expr_list) },
      NamedFunction,
      { name = 'global_all', opt(attribute), '*' }
    ),
  }

local DoBlock = { name = 'do_block', 'do', '>statements', 'end' }

local IfBlock =
  {
    name = 'if_block',
    { name = 'if_part', 'if', '>expression', 'then', '>statements' },
    opt_rep(
      {
        name = 'elseif_part',
        'elseif', '>expression', 'then', '>statements'
      }
    ),
    opt({ name = 'else_part', 'else', '>statements' }),
    'end',
  }

local WhileBlock =
  {
    name = 'while_block',
    'while', '>expression', 'do', '>statements', 'end'
  }

local RepeatBlock =
  {
    name = 'repeat_block',
    'repeat', '>statements', 'until', '>expression'
  }

local GenericForBlock =
  {
    name = 'generic_for_block',
    'for', name_list, 'in', expr_list, 'do', '>statements', 'end'
  }

local NumericForBlock =
  {
    name = 'numeric_for_block',
    'for',
    Name,
    '=',
    '>expression',
    ',',
    '>expression',
    opt(',', '>expression'),
    'do',
    '>statements',
    'end',
  }

local ReturnStatement =
  {
    name = 'return_statement',
    'return', opt(expr_list), opt(EmptyStatement)
  }

return
  {
    name = 'statements',
    inner_name = 'statements',
    opt_rep(
      cho(
        AssignOrCall,
        NamedFunction,

        EmptyStatement,
        LabelStatement,
        GotoStatement,
        BreakStatement,

        LocalStatement,
        GlobalStatement,

        DoBlock,
        IfBlock,
        WhileBlock,
        RepeatBlock,
        GenericForBlock,
        NumericForBlock
      )
    ),
    opt(ReturnStatement),
  }

--[[
  2013 # # # # #
  2016 # # # # # #
  2017 #
  2018 # # #
  2026 # #
  2026-10-28
]]
