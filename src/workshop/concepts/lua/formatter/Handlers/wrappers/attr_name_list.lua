-- Attributed name list serialization

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

--[[
  "local <a> b <c>" is parsed to

    {
      type = 'attr_name_list',
      list_attr =
        {
          type = 'attribute',
          {
            type = 'name',
            value = 'a',
          },
        },
      {
        type = 'attr_name',
        {
          type = 'name',
          value = 'b',
        },
        {
          type = 'attribute',
          {
            type = 'name',
            value = 'c',
          },
        },
      },
    }
]]

local process_expr_list = request('expr_list')

return
  function(Me, Node)
    local Printer = Me[2]
    if Node.list_attr then
      Me:ProcessNode(Node.list_attr)
      Printer:AddToCurline(' ')
    end
    return process_expr_list(Me, Node)
  end

--[[
  2026-10-28
]]
