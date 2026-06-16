--[[

  <statements>:

    ---+-------------------------------+---+----------------------+---+-------------+---
       | +---------------------------- |   +- <return_statement> -+   +- <opt_spc> -+
       | V                           / |
       +---+- <assign_or_call> ----+---+
           +- <named_function> ----+
           +- <empty_statement> ---+
           +- <label_statement> ---+
           +- <goto_statement> ----+
           +- <local_statement> ---+
           +- <break_statement> ---+
           +- <do_block> ----------+
           +- <if_block> ----------+
           +- <while_block> -------+
           +- <repreat_block> -----+
           +- <generic_for_block> -+
           +- <numeric_for_block> -+
]]

local handy = request('!.mechs.processor.handy')
local opt = handy.opt
local opt_rep = handy.opt_rep
local cho = handy.cho

local assign_or_call = request('statements.assign_or_call')
local named_function = request('statements.named_function')

local empty_statement = request('statements.empty_statement')
local label_statement = request('statements.label_statement')
local goto_statement = request('statements.goto_statement')
local local_statement = request('statements.local_statement')
local break_statement = request('statements.break_statement')

local do_block = request('statements.do_block')
local if_block = request('statements.if_block')
local while_block = request('statements.while_block')
local repeat_block = request('statements.repeat_block')
local generic_for_block = request('statements.generic_for_block')
local numeric_for_block = request('statements.numeric_for_block')

local return_statement = request('statements.return_statement')
local opt_spc = request('words.opt_spc')

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
        local_statement,
        break_statement,

        do_block,
        if_block,
        while_block,
        repeat_block,
        generic_for_block,
        numeric_for_block
      )
    ),
    opt(return_statement),
    opt_spc,
  }

--[[
2013-07-08
2013-07-09
2013-07-10
2013-07-15
2013-12-23
2016-07-26
2016-07-27
2016-08-03
2016-08-04
2016-08-16
2016-09-21
2017-08-28
2018-01-23
2018-02-07
]]
