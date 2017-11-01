local result =
  {
    expression = request('expression'),
    statements = request('statements'),
  }

local merge = request('!.table.merge')
merge(result, request('expressions.interface'))
merge(result, request('statements.interface'))

return result
