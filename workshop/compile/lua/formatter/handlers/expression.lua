local oneliner =
  function(self, node)
    local printer = self.printer
    for term_idx = 1, #node do
      local term = node[term_idx]
      if term.un_ops then
        local cur_un_op, prev_un_op
        for i = 1, #term.un_ops do
          cur_un_op = term.un_ops[i]
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
      self:process_node(term.operand)
      if term.bin_op then
        printer:add_text(' ' .. term.bin_op .. ' ')
      end
    end
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

local multiliner =
  function(self, node)
    local printer = self.printer

    printer:request_clean_line()
    for term_idx = 1, #node do
      local term = node[term_idx]
      if term.un_ops then
        local cur_un_op, prev_un_op
        for i = 1, #term.un_ops do
          cur_un_op = term.un_ops[i]
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
      self:process_node(term.operand)
      if term.bin_op then
        printer:add_text(' ' .. term.bin_op)
        if line_wrap_ops[term.bin_op] then
          printer:close_line()
        else
          printer:add_text(' ')
        end
      end
    end
    printer:request_clean_line()
  end

local variants =
  {
    {multiliner, is_multiline = true},
    oneliner,
  }

return
  function(self, node)
    self:variate(variants, node)
  end
