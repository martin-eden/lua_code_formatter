local map_values = request('!.table.map_values')

return
  map_values(
    {
      'nil',
      'true',
      'false',
      'not',
      'and',
      'or',
      'do',
      'end',
      'local',
      'function',
      'if',
      'then',
      'elseif',
      'else',
      'while',
      'repeat',
      'until',
      'for',
      'in',
      'break',
      'return',
    }
  )
