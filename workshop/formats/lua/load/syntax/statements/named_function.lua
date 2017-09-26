local handy = request('!.mechs.processor.handy')

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
      handy.list(name, {opt_spc, '.'}),
    },
    handy.opt(
      {
        name = 'colon_name',
        opt_spc, ':',
        name
      }
    ),
    function_body,
  }
