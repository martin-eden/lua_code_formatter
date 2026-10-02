--[[
  Grammar for expressions and statements is mutually linked.
  To this moment it was just ">expression" and ">statements" strings.
  Now we load their grammars and change those strings to that.
]]

local link = request('!.mechs.processor.link')
local optimize = request('!.mechs.processor.optimize')

local expression = request('syntax.expression')
local statements = request('syntax.statements')

local producers, consumers = {}, {}

link(expression, producers, consumers)
link(statements, producers, consumers)

assert(not next(consumers))

optimize(statements)

return statements
