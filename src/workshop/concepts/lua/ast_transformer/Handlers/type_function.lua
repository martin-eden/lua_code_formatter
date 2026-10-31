-- Transform "type_function"

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
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
  function(Node)
    Node.params = Node[1]
    Node[1] = nil

    Node.body = Node[2]
    Node[2] = nil
  end

--[[
  2018 #
  2026-10-31
]]
