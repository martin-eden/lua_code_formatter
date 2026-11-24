-- Transform expression

--[[
  Author: Martin Eden
  Last mod.: 2026-11-24
]]

--[[
  Sample input ("-42 + -42")

    {
      type = 'expression',
      { type = 'un_op', '-' },
      { type = 'number', value = '42' },
      { type = 'bin_op', value = '+' },
      {
        type = 'expression',
        { type = 'un_op', '-' },
        { type = 'number', '42' },
      },
    }

  Sample output

    {
      type = 'expression',
      { { '-' }, { type = 'number', value = '42' }, '+' },
      { { '-' }, { type = 'number', value = '42' } },
    }

]]

local replace = request('!.table.replace')
local add_to_list = request('!.concepts.list.add_item')

return
  function(node)
    local result = { }

    local i = 1

    local num_items = #node

    local term = { }

    local un_ops = { }
    while (i <= num_items) and (node[i].type == 'un_op') do
      add_to_list(un_ops, node[i].value)
      i = i + 1
    end
    term[1] = un_ops

    term[2] = node[i]
    node[i] = nil
    i = i + 1

    if (i < num_items) and (node[i].type == 'bin_op') then
      term[3] = node[i].value
      i = i + 1
    end

    add_to_list(result, term)

    if (i == num_items) then
      local last_node = node[i]
      if (last_node.type == 'expression') then
        -- Child node is already processed record. Due to align_nodes().
        for _, last_node_item in ipairs(last_node) do
          add_to_list(result, last_node_item)
        end
      end
    end

    result.type = node.type

    replace(node, result)
  end

--[[
  2018 # #
  2026 #
  2026-11-24
]]
