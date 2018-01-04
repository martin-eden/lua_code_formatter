-- These are core cycle nodes. Loaded separately to avoid cycles in require()

local expression = request('syntax.expressions.expression')
local statement = request('syntax.statements.statement')
local statements = request('syntax.statements.statements')

local producers, consumers = {}, {}

local link = request('!.mechs.processor.link')
link(expression, producers, consumers)
link(statement, producers, consumers)
link(statements, producers, consumers)
assert(not next(consumers))

local optimize = request('!.mechs.processor.optimize')
optimize(statements)

return statements
