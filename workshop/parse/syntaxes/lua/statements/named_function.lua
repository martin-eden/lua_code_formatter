local parser = request('^.^.^.parser')
local handy = parser.handy

local word = request('^.words.word')
local opt_spc = request('^.words.opt_spc')
local name = request('^.words.name')
local function_body = request('function_body')

return
  {
    name = 'named_function',
    word('function'),
    {
      name = 'dot_list',
      handy.list({opt_spc, name}, {opt_spc, '.'}),
    },
    handy.opt(
      {
        name = 'colon_name',
        opt_spc, ':',
        opt_spc, name
      }
    ),
    opt_spc, function_body,
  }
