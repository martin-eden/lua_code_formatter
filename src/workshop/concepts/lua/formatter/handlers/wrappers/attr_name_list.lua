-- Attributed name list serialization

--[[
  Author: Martin Eden
  Last mod.: 2026-11-24
]]

--[[
  "local <a> b <c>" is parsed to

    {
      type = 'attr_name_list',
      [1] =
        {
          type = 'list_attr',
          [1] = { type = 'attribute', [1] = { type = 'name', value = 'a' } },
        },
      [2] =
        {
          type = 'attr_names',
          [1] =
            {
              type = 'attr_name',
              [1] = { type = 'name', value = 'b' },
              [2] = { type = 'attribute', [1] = { type = 'name', value = 'c' } },
            },
        },
    }
]]

local process_expr_list = request('expr_list')

return
  function(me, node)
    local names
    if (node[1].type == 'list_attr') then
      if not me:process_node(node[1][1]) then return end
      me[1]:add_to_curline(' ')
      names = node[2]
    else
      names = node[1]
    end
    return process_expr_list(me, names)
  end

--[[
  2026-10-28
]]
