-- Transform expression Node

--[[
  Author: Martin Eden
  Last mod.: 2026-10-23
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
  function(Me, Node)
    local Result = { }

    local i = 1

    local num_items = #Node

    local Term = { }

    if (Node[i].type == 'un_op') then
      local UnOps = { }
      while (Node[i].type == 'un_op') and (i <= num_items) do
        add_to_list(UnOps, Node[i].value)
        i = i + 1
      end
      Term.un_ops = UnOps
    end

    Term.operand = Node[i]
    Node[i] = nil
    i = i + 1

    if (i < num_items) and (Node[i].type == 'bin_op') then
      Term.bin_op = Node[i].value
      i = i + 1
    end

    add_to_list(Result, Term)

    if (i == num_items) then
      local LastNode = Node[i]
      if (LastNode.type == 'expression') then
        -- Child node is already processed record. Due to align_nodes().
        for _, LastNodeItem in ipairs(LastNode) do
          add_to_list(Result, LastNodeItem)
        end
      end
    end

    Result.type = Node.type

    replace(Node, Result)
  end

--[[
  2016 #
  2018 # #
  2026-10-23
]]
