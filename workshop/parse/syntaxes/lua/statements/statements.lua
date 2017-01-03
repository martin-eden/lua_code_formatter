local parser = request('^.^.^.parser')
local handy = parser.handy

local return_statement = request('return_statement')
local opt_spc = request('^.words.opt_spc')

return
  {
    opt_spc,
    {
      name = 'statements',
      handy.opt(handy.list('>statement', opt_spc)),
      handy.opt(opt_spc, return_statement),
    },
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
]]
