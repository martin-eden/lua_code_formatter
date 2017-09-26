local handy = request('!.mechs.processor.handy')

local call_assign = request('call_assign')
local named_function = request('named_function')

local empty_statement = request('empty_statement')
local label_statement = request('label_statement')
local goto_statement = request('goto_statement')
local local_statement = request('local_statement')
local break_statement = request('break_statement')

local do_block = request('do_block')
local if_block = request('if_block')
local while_block = request('while_block')
local repeat_block = request('repeat_block')
local generic_for_block = request('generic_for_block')
local numeric_for_block = request('numeric_for_block')

return
  {
    inner_name = 'statement',
    handy.cho(
      call_assign,
      named_function,

      empty_statement,
      label_statement,
      goto_statement,
      local_statement,
      break_statement,

      do_block,
      if_block,
      while_block,
      repeat_block,
      generic_for_block,
      numeric_for_block
    )
  }
