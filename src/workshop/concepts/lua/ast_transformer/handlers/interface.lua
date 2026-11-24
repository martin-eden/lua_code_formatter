-- Node transformers

--[[
  Author: Martin Eden
  Last mod.: 2026-11-24
]]

-- Map of node type to function

return
  {
    ['assignment'] = request('assignment'),
    ['expression'] = request('expression'),
    ['function_call'] = request('function_call'),
    ['var_ref'] = request('var_ref'),
  }

--[[
  2018 #
  2026-10-28
]]
