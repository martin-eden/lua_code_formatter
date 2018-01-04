local handy = request('!.mechs.processor.handy')
local opt = handy.opt
local list = handy.list

local word = request('^.words.word')
local syntel = request('^.words.syntel')
local name = request('^.words.name')
local function_body = request('function_body')

return
  {
    name = 'named_function',
    word('function'),
    {
      name = 'dot_list',
      list(name, syntel('.')),
    },
    opt(
      {
        name = 'colon_name',
        syntel(':'),
        name
      }
    ),
    function_body,
  }
