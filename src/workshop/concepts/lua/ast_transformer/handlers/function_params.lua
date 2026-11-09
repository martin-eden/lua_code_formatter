-- Transform "function_params"

--[[
  Author: Martin Eden
  Last mod.: 2026-11-09
]]

--[[
  Sample input

    {
      type = 'function_params',
      [1] = { type = 'name_list', { type = 'name', 'x' } },
      [2] = { type = 'vararg', '...' },
    }

  Sample output

    {
      type = 'function_params',
      [1] = { type = 'name', 'x' },
      [2] = { type = 'vararg', '...' },
    }
]]

--[[
  So if first node is "name_list", we're just lifting it's
  elements.

  Looks like we can use [table.replace] but we shouldn't:
  patch table will contain references to source table,
  so source table will mutate in process.

  We can carefully write this uplift manually here. It's hard
  to code and understand "why".

  We can clone patch table and then call [table.replace].
  Clone consumes more memory and not suitable in cases when
  we have references to instances in data (like output stream).
]]

local add_to_list = request('!.concepts.list.add_item')
local replace = request('!.table.replace')

return
  function(node)
    local result = { type = node.type }

    if node[1] then
      if (node[1].type == 'name_list') then
        for _, name_rec in ipairs(node[1]) do
          add_to_list(result, name_rec)
        end
      else
        add_to_list(result, node[1])
      end
    end
    if node[2] then
      add_to_list(result, node[2])
    end

    result = new(result)

    replace(node, result)
  end

--[[
  2018 #
  2026-10-21
  2026-10-24
]]
