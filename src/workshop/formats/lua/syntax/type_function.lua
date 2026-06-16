local handy = request('!.mechs.processor.handy')

local word = request('words.word')
local function_body = request('statements.function_body')

return
  {
    name = 'type_function',
    word('function'),
    function_body,
  }
