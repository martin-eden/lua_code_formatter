local parser = request('^.^.^.parser')
local handy = parser.handy

local word = request('word')

local is_keyword =
  handy.cho1(
    word('nil'),
    word('false'),
    word('true'),
    word('not'),
    word('and'),
    word('or'),
    word('do'),
    word('end'),
    word('function'),
    word('while'),
    word('repeat'),
    word('until'),
    word('for'),
    word('in'),
    word('if'),
    word('then'),
    word('elseif'),
    word('else'),
    word('return'),
    word('local'),
    word('goto'),
    word('break')
  )

local name_pattern = '[_A-Za-z][_A-Za-z0-9]*'

return
  {
    name = 'name',
    handy.is_not(is_keyword),
    handy.match_pattern(name_pattern),
  }
