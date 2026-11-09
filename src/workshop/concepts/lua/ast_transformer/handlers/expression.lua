-- Transform expression

--[[
  Author: Martin Eden
  Last mod.: 2026-11-12
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
      {
        operand = { type = 'number', value = '42' },
        bin_op = '+',
        un_ops = { '-' },
      },
      {
        operand = { type = 'number', value = '42' },
        un_ops = { '-' },
      },
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

    if (node[i].type == 'un_op') then
      local un_ops = { }
      while (node[i].type == 'un_op') and (i <= num_items) do
        add_to_list(un_ops, node[i].value)
        i = i + 1
      end
      term.un_ops = un_ops
    end

    term.operand = node[i]
    node[i] = nil
    i = i + 1

    if (i < num_items) and (node[i].type == 'bin_op') then
      term.bin_op = node[i].value
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
  2026-10-23
]]
