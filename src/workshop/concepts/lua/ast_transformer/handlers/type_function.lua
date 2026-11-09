-- Transform "type_function"

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  {
    type = 'type_function',
    {
      type = 'function_params',
      value = '()',
    },
    {
      type = 'statements',
    },
  }
]]

return
  function(node)
    node.params = node[1]
    node[1] = nil

    node.body = node[2]
    node[2] = nil
  end

--[[
  2018 #
  2026-10-31
]]
