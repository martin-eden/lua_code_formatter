--[[
  Return table with string names of all Lua datatypes.

  Used in generating assert_<type> functions.

  -> table
]]

return
  {
    'nil',
    'boolean',
    'number',
    'string',
    'function',
    'thread',
    'userdata',
    'table',
  }
