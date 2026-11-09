-- Lua statements grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
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

local assign_or_call
do
  local ref_or_call = request('qualifiers.var_or_call')
  local expr_list = request('wrappers.expr_list')

  assign_or_call =
    {
      name = 'assign_or_call',
      ref_or_call,
      opt(
        opt_rep(',', ref_or_call),
        '=',
        expr_list
      ),
    }
end

local named_function = request('statements.named_function')

local name = request('words.name')

local empty_statement = { name = 'empty_statement', ';' }
local label_statement = { name = 'label_statement', '::', name, '::' }
local goto_statement = { name = 'goto_statement', 'goto', name }
local break_statement = { name = 'break_statement', 'break' }

local name_list = request('wrappers.name_list')
local expr_list = request('wrappers.expr_list')

local attribute = { name = 'attribute', '<', name, '>' }

local attr_name_list
do
  local attr_name = { name = 'attr_name', name, opt(attribute) }
  local list = request('!.mechs.processor.handy').list

  attr_name_list =
    {
      name = 'attr_name_list',
      opt(attribute),
      list(attr_name, ','),
    }
end

local local_statement =
  {
    name = 'local_statement',
    'local',
    cho(
      { name = 'local_assignment', attr_name_list, opt('=', expr_list) },
      named_function
    ),
  }

local global_statement =
  {
    name = 'global_statement',
    'global',
    cho(
      { attr_name_list, opt('=', expr_list) },
      named_function,
      { name = 'global_all', opt(attribute), '*' }
    ),
  }

local do_block = { name = 'do_block', 'do', '>statements', 'end' }

local if_block =
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

local while_block =
  {
    name = 'while_block',
    'while', '>expression', 'do', '>statements', 'end'
  }

local repeat_block =
  {
    name = 'repeat_block',
    'repeat', '>statements', 'until', '>expression'
  }

local generic_for_block =
  {
    name = 'generic_for_block',
    'for', name_list, 'in', expr_list, 'do', '>statements', 'end'
  }

local numeric_for_block =
  {
    name = 'numeric_for_block',
    'for',
    name,
    '=',
    '>expression',
    ',',
    '>expression',
    opt(',', '>expression'),
    'do',
    '>statements',
    'end',
  }

local return_statement =
  {
    name = 'return_statement',
    'return', opt(expr_list), opt(empty_statement)
  }

return
  {
    name = 'statements',
    inner_name = 'statements',
    opt_rep(
      cho(
        assign_or_call,
        named_function,

        empty_statement,
        label_statement,
        goto_statement,
        break_statement,

        local_statement,
        global_statement,

        do_block,
        if_block,
        while_block,
        repeat_block,
        generic_for_block,
        numeric_for_block
      )
    ),
    opt(return_statement),
  }

--[[
  2013 # # # # #
  2016 # # # # # #
  2017 #
  2018 # # #
  2026 # #
  2026-10-28
]]
