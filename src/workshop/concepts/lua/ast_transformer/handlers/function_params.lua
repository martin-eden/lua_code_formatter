-- Transformation of "function_params" record

--[[
  Author: Martin Eden
  Last mod.: 2026-10-24
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
  function(Me, Node)
    local Result = { type = Node.type }

    if Node[1] then
      if (Node[1].type == 'name_list') then
        for _, NameRec in ipairs(Node[1]) do
          add_to_list(Result, NameRec)
        end
      else
        add_to_list(Result, Node[1])
      end
    end
    if Node[2] then
      add_to_list(Result, Node[2])
    end

    Result = new(Result)

    replace(Node, Result)
  end

--[[
  2018 #
  2026-10-21
  2026-10-24
]]
