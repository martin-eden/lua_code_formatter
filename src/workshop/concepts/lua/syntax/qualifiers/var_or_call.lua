-- Variable reference or function call grammar

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  <var_or_call>

    ─┬─── name ───┬─┬──────────────────────────────────┬─
     └─ ( expr ) ─┘ │ ┌──────────────────────────────┐ │
                    │ ▼                              │ │
                    └───┬── [ expr ] ──────────────┬─┴─┘
                        ├── . name ────────────────┤
                        └─┬──────────┬─ func_args ─┘
                          └─ : name ─┘

  Examples:

    a[b].c().d - variable reference
    a[b].c() - function call

  So function call ends on function arguments part while variable
  referece does not.

  For clarity this grammar may be split in two. But it will severely
  hurt performance, because these structures have common prefix.

  Allowing such hybrid structure is good for runtime performance but
  increases code complexity as later we have to post-process result
  and classify every such entry to "reference" or "function call".

  (Implementation with classification pass is usually faster than
  with overlapping grammars.)
]]

local handy = request('!.mechs.processor.handy')
local cho = handy.cho
local opt = handy.opt
local opt_rep = handy.opt_rep

local name = request('^.words.name')
local bracket_expr = request('^.wrappers.bracket_expr')
local dot_name = { name = 'dot_name', '.', name }
local colon_name = request('^.wrappers.colon_name')

local func_args
do
  local expr_list = request('^.wrappers.expr_list')
  local type_string = request('^.type_string')
  local type_table = request('^.type_table')

  func_args =
    {
      name = 'func_args',
      cho(
        { '(', opt(expr_list), ')' },
        type_string,
        type_table
      ),
    }
end

return
  {
    name = 'var_or_call',
    cho(name, { name = 'par_expr', '(', '>expression', ')' }),
    opt_rep(
      cho(
        bracket_expr,
        dot_name,
        {
          opt(colon_name),
          func_args,
        }
      )
    ),
  }

--[[
  2018 # #
  2026-10-25
]]
