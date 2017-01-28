-- These are core cycle nodes. Loaded separately to avoid cycles in require()

local parser = request('^.parser')

local producers, consumers
local expression = request('lua.expressions.expression')
producers, consumers = parser.link(expression, producers, consumers)

local statement = request('lua.statements.statement')
producers, consumers = parser.link(statement, producers, consumers)

local statements = request('lua.statements.statements')
producers, consumers = parser.link(statements, producers, consumers)
assert(not next(consumers))
parser.optimize(statements)

return statements
