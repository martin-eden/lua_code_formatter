-- Expression serialization

--[[
  Author: Martin Eden
  Last mod.: 2026-10-31
]]

local represent_operand_oneline =
  function(Me, Node)
    local Printer = Me[2]
    if Node.un_ops then
      local cur_un_op, prev_un_op
      for _, cur_un_op in ipairs(Node.un_ops) do
        if (prev_un_op == '-') and (cur_un_op == '-') then
          -- Avoiding "-" "-" clash to comment "--"
          Printer:AddToCurline(' -')
        elseif (cur_un_op == 'not') then
          Printer:AddToCurline('not ')
        else
          Printer:AddToCurline(cur_un_op)
        end
        prev_un_op = cur_un_op
      end
    end
    if not Me:process_node(Node.operand) then
      return
    end
    if Node.bin_op then
      Printer:AddToCurline(' ' .. Node.bin_op .. ' ')
    end
    return true
  end

local oneliner =
  function(Me, Node)
    for _, Term in ipairs(Node) do
      if not represent_operand_oneline(Me, Term) then
        return
      end
    end
    return true
  end

local line_wrap_ops =
  {
    ['and'] = true,
    ['or'] = true,
    ['+'] = true,
    ['-'] = true,
    ['*'] = true,
    ['/'] = true,
    ['//'] = true,
    ['..'] = true,
  }

local represent_operand_multiline =
  function(Me, Node)
    if not represent_operand_oneline(Me, Node) then
      return
    end
    if line_wrap_ops[Node.bin_op] then
      Me[2]:RequestCleanLine()
    end
    return true
  end

local multiliner =
  function(Me, Node)
    Me[2]:RequestCleanLine()
    for _, Term in ipairs(Node) do
      if not represent_operand_multiline(Me, Term) then
        return
      end
    end
    return true
  end

return
  function(Me, Node)
    return Me:variate(Node, oneliner, multiliner)
  end

--[[
  2016 #
  2017 #
  2026-10-23
]]
