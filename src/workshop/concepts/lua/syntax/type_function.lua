-- Grammar for function

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
]]

local opt_spc = request('words.opt_spc')
local word = request('words.word')
local function_body = request('statements.function_body')

return
  {
    name = 'type_function',
    opt_spc,
    word('function'),
    function_body,
  }

--[[
  2016 #
  2018 #
  2026-10-22
]]
