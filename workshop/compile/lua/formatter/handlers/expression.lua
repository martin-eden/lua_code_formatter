local represent_operand_oneline =
  function(self, node)
    local printer = self.printer
    if node.un_ops then
      local cur_un_op, prev_un_op
      for i = 1, #node.un_ops do
        cur_un_op = node.un_ops[i]
        if (prev_un_op == '-') and (cur_un_op == '-') then
          printer:add_text(' -')
        elseif (cur_un_op == 'not') then
          printer:add_text('not ')
        else
          printer:add_text(cur_un_op)
        end
        prev_un_op = cur_un_op
      end
    end
    if not self:process_node(node.operand) then
      return
    end
    if node.bin_op then
      printer:add_text(' ' .. node.bin_op .. ' ')
    end
    return true
  end

local oneliner =
  function(self, node)
    for term_idx = 1, #node do
      if not represent_operand_oneline(self, node[term_idx]) then
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
  function(self, node)
    if not represent_operand_oneline(self, node) then
      return
    end
    if line_wrap_ops[node.bin_op] then
      self.printer:request_clean_line()
    end
    return true
  end

local multiliner =
  function(self, node)
    local printer = self.printer
    printer:request_clean_line()
    for term_idx = 1, #node do
      if not represent_operand_multiline(self, node[term_idx]) then
        return
      end
    end
    return true
  end

return
  function(self, node)
    return self:variate(node, oneliner, multiliner)
  end
