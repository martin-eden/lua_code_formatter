-- These are core cycle nodes. Loaded separately to avoid cycles in require()

local parser = request('^.parser')
local to_str = request('^.^.save_to.lua.serialize_table.lua_code')

local producers, consumers
local expression = request('lua.expressions.expression')
-- print(to_str(expression))
producers, consumers = parser.link(expression, producers, consumers)

local statement = request('lua.statements.statement')
-- print(to_str(statement))
producers, consumers = parser.link(statement, producers, consumers)

local statements = request('lua.statements.statements')
producers, consumers = parser.link(statements, producers, consumers)
assert(not next(consumers))
parser.optimize(statements)
-- print(to_str(statements))

return statements
