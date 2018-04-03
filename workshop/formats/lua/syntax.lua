-- These are core cycle nodes. Loaded separately to avoid cycles in require()

local expression = request('syntax.expression')
local statements = request('syntax.statements')

local producers, consumers = {}, {}

local link = request('!.mechs.processor.link')
link(expression, producers, consumers)
link(statements, producers, consumers)
assert(not next(consumers))

local optimize = request('!.mechs.processor.optimize')
optimize(statements)

return statements
