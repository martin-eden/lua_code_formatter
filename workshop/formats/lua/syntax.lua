-- These are core cycle nodes. Loaded separately to avoid cycles in require()

local parser = request('!.mechs.parser')

local expression = request('syntax.expressions.expression')
local statement = request('syntax.statements.statement')
local statements = request('syntax.statements.statements')

local producers, consumers = {}, {}

parser.link(expression, producers, consumers)
parser.link(statement, producers, consumers)
parser.link(statements, producers, consumers)

assert(not next(consumers))

parser.optimize(statements)

return statements
