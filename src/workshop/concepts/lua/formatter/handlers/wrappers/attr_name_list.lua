-- Attributed name list serialization

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
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
  function(me, node)
    if node.list_attr then
      me:process_node(node.list_attr)
      me[1]:add_to_curline(' ')
    end
    return process_expr_list(me, node)
  end

--[[
  2026-10-28
]]
