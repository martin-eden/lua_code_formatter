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
  function(self, node)
    node.params = node[1]
    node[1] = nil

    node.body = node[2]
    node[2] = nil
  end
