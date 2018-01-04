local handy = request('!.mechs.processor.handy')
local opt = handy.opt
local opt_rep = handy.opt_rep

local return_statement = request('return_statement')
local opt_spc = request('^.words.opt_spc')

return
  {
    name = 'statements',
    opt_rep('>statement'),
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
]]
