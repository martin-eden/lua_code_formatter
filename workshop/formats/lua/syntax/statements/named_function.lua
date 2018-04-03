local handy = request('!.mechs.processor.handy')
local list = handy.list
local opt = handy.opt

local word = request('^.words.word')
local syntel = request('^.words.syntel')
local name = request('^.words.name')
local colon_name = request('^.wrappers.colon_name')
local function_body = request('function_body')

return
  {
    name = 'named_function',
    word('function'),
    {
      name = 'dot_list',
      list(name, syntel('.')),
    },
    opt(colon_name),
    function_body,
  }
